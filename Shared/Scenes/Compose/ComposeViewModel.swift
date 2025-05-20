import Foundation
import Combine

class ComposeViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var quoteText: String = ""
    @Published var artist: String = ""
    @Published var song: String = ""
    @Published var genre: String = ""
    @Published var mood: String = ""
    
    // MARK: - Search States
    @Published var artistSearchText: String = ""
    @Published var songSearchText: String = ""
    @Published var genreSearchText: String = ""
    @Published var moodSearchText: String = ""
    
    // MARK: - Suggestions
    @Published var artistSuggestions: [String] = []
    @Published var songSuggestions: [String] = []
    @Published var genreSuggestions: [String] = []
    @Published var moodSuggestions: [String] = []
    
    // MARK: - Loading States
    @Published var isSearching: Bool = false
    
    // MARK: - Validation States
    @Published var isFormValid: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    private let quoteClient = QuoteClient()
    private var searchTask: Task<Void, Never>?
    
    init() {
        setupValidation()
        setupSearchBindings()
    }
    
    // MARK: - Private Methods
    private func setupValidation() {
        Publishers.CombineLatest4($quoteText, $artist, $song, $mood)
            .map { quote, artist, song, mood in
                !quote.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
                !artist.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
                !song.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
                !mood.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            }
            .assign(to: \.isFormValid, on: self)
            .store(in: &cancellables)
    }
    
    private func setupSearchBindings() {
        // Artist search
        $artistSearchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard !query.isEmpty else {
                    self?.artistSuggestions = []
                    return
                }
                self?.performSearch(query: query, for: .artist)
            }
            .store(in: &cancellables)
        
        // Song search
        $songSearchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard !query.isEmpty else {
                    self?.songSuggestions = []
                    return
                }
                self?.performSearch(query: query, for: .song)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Public Methods
    func performSearch(query: String, for type: SuggestionType) {
        // Cancel any existing search task
        searchTask?.cancel()
        
        // Create new search task
        searchTask = Task {
            do {
                await MainActor.run { isSearching = true }
                defer { 
                    Task { @MainActor in
                        isSearching = false 
                    }
                }
                
                let searchType: Int
                switch type {
                case .artist:
                    searchType = 0 // Assuming 0 is for artist search
                case .song:
                    searchType = 1 // Assuming 1 is for song search
                case .genre, .mood:
                    // Handle genre and mood differently if needed
                    return
                }
                
                let results = try await quoteClient.peformSpotifySearch(query: query, type: searchType)
                
                results
                    .receive(on: DispatchQueue.main)
                    .sink { error in
                        print("❌ error", error)
                    } receiveValue: { [weak self] artists in
                        guard let self = self else { return }
                        switch type {
                        case .artist:
                            self.artistSuggestions = artists.compactMap(\.name)
                        case .song:
                            self.songSuggestions = artists.compactMap(\.name)
                        case .genre, .mood:
                            break
                        }
                    }
                    .store(in: &cancellables)
                
            } catch {
                print("❌ Search error: \(error)")
                await MainActor.run {
                    switch type {
                    case .artist:
                        self.artistSuggestions = []
                    case .song:
                        self.songSuggestions = []
                    case .genre, .mood:
                        break
                    }
                }
            }
        }
    }
    
    func handleSuggestionSelected(_ suggestion: String, for type: SuggestionType) {
        switch type {
        case .artist:
            artist = suggestion
            artistSearchText = suggestion
        case .song:
            song = suggestion
            songSearchText = suggestion
        case .genre:
            genre = suggestion
            genreSearchText = suggestion
        case .mood:
            mood = suggestion
            moodSearchText = suggestion
        }
    }
    
    func submitQuote() {
        guard isFormValid else { return }
        
        let quote = Quote(
            id: -1,
            quote: quoteText,
            songTitle: song,
            artist: Artist(id: -2, name: artist, category: -1, profileImageURL: nil),
            contributor: Contributor(id: -1, email: "elviva", name: "Elikem"),
            isFeatured: true
        )
        
        print("Submitting quote: \(quote)")
        resetForm()
    }
    
    private func resetForm() {
        quoteText = ""
        artist = ""
        song = ""
        genre = ""
        mood = ""
        artistSearchText = ""
        songSearchText = ""
        genreSearchText = ""
        moodSearchText = ""
        artistSuggestions = []
        songSuggestions = []
    }
}

// MARK: - Supporting Types
enum SuggestionType {
    case artist
    case song
    case genre
    case mood
}
