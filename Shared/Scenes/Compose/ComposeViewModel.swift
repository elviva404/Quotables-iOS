import Foundation
import Combine

@MainActor
class ComposeViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var quoteText: String = ""
    @Published var artist: SpotifyArtist?
    @Published var song: SpotifyArtist?
    @Published var genre: String?
    @Published var mood: Set<String> = []
    
    // MARK: - Search States
    @Published var artistSearchText: String = ""
    @Published var songSearchText: String = ""
    @Published var genreSearchText: String = ""
    @Published var moodSearchText: String = ""
    
    // MARK: - Suggestions
    @Published var artistSuggestions: [SpotifyArtist] = []
    @Published var songSuggestions: [SpotifyArtist] = []
    @Published var genreSuggestions: [String] = []
    @Published var moodSuggestions: [String] = []

    @Published var qtErrorDialog: ErrorResponse?
    @Published var createdQuote: Quote?

    @Published var isLoading: Bool = false
    
    // MARK: - Loading States
    @Published var isSearching: Bool = false
    
    // MARK: - Validation States
//    @Published var isFormValid: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    private let quoteClient: QuoteClientProtocol
    private var searchTask: Task<Void, Never>?
    
    init(quoteClient: QuoteClientProtocol) {
        self.quoteClient = quoteClient
        setupSearchBindings()
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
    
    func performSearch(query: String, for type: SuggestionType) {
        searchTask?.cancel()
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
                            self.artistSuggestions = artists.data ?? []
                        case .song:
                            self.songSuggestions = artists.data ?? []
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

    func handleSuggestionSelected(
        _ suggestion: any Searchable,
        for type: SuggestionType
    ) {
        switch type {
        case .artist:
            if let spotifyArtist = suggestion as? SpotifyArtist {
                artist = spotifyArtist
                artistSearchText = spotifyArtist.name
            }
        case .song:
            if let spotifyArtist = suggestion as? SpotifyArtist {
                song = spotifyArtist
                songSearchText = spotifyArtist.name
            }
        case .genre:
            genre = suggestion.name
            genreSearchText = suggestion.name
        case .mood:
            mood = [suggestion.name]
            moodSearchText = suggestion.name
        }
    }

    func submitQuote() {
//        guard isFormValid else { return }
        
        let quote = Quote(
            quote: quoteText,
            songTitle: song?.name,
            artist: artist?.toArtist,
            contributor: Contributor(
                email: "elviva",
                name: "Elikem"
            ),
            isFeatured: true
        )

        isLoading = true
        
        Task {
            do {
                try await quoteClient.createQuote(quote: quote)
                    .receive(on: DispatchQueue.main)
                    .sink { result in
                        switch result {
                        case .finished:
                            print("Was succesful")
                        case .failure(let error):
                            guard let qtError = error as? ErrorResponse else { return }
                            self.qtErrorDialog = qtError
                        }
                        self.isLoading = false
                    } receiveValue: { [weak self] createdQuote in
                        guard let _self = self else { return }
                        _self.createdQuote = createdQuote.data 
                        _self.isLoading = false
                    }
                    .store(in: &cancellables)
            } catch {
                self.isLoading = false
                let genericError = ErrorResponse()
                genericError.message = error.localizedDescription
                self.qtErrorDialog = genericError
            }
            
        }

    }
    
    private func resetForm() {
        quoteText = ""
        artist = nil
        song = nil
        genre = ""
        mood = []
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
