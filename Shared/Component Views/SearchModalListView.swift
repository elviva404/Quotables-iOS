//
//  ModalListView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 18/05/2022.
//

import SwiftUI
import Combine

struct SearchModalListView: View {
    
//    enum Usage {
//        case song
//        case artist
//        case genre
//    }
    
    var usage: SpotifyArtist.MediaType = .artist
    let items = Array(0..<100)

    var title: String
    var searchplaceholder: String
    

    @State var searchQuery = ""
    @ObservedObject var viewmodel = ModalListViewModel()

    @State private var selectedItem: String?


//    var songs: [Song] {
//        var _songs = [Song]()
//        for _ in items {
//            _songs.append(Song())
//        }
//        return _songs
//    }
//
//    var artists: [Artist] {
//        var _artists = [Artist]()
//        for _ in items {
//            _artists.append(Artist(id: nil, name: nil))
//        }
//        return _artists
//    }

    var body: some View {
        NavigationView {
            List(selection: $selectedItem) {
                ForEach(viewmodel.sporifyArtist) { item in
                    ArtistCellView(spotifyArtist: item)
                }
            }
            .listStyle(GroupedListStyle())
            .searchable(text: $searchQuery, prompt: searchplaceholder)
            .onSubmit(of: .search) {
            }
            .onChange(of: searchQuery) { text in
                viewmodel.peformSearch(query: text, type: usage.rawValue)
            }
            .onTapGesture {
                print("🤣 hery", selectedItem)
            }
            .navigationTitle(title)
        }
    }

}

struct ModalListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchModalListView(title: "Select Genre", searchplaceholder: "Search for Genre")
    }
}

final class ModalListViewModel: ObservableObject {
    
    let client = QuoteClient()
    var anyCancellables = Set<AnyCancellable>()
    @Published private(set) var sporifyArtist = [SpotifyArtist]()

    func peformSearch(query: String, type: Int) {
        Task {
            do {
                let res = try await client.peformSpotifySearch(query: query, type: type)
                res.sink { errors in
                    print("errors", errors)
                } receiveValue: { results in
                    self.sporifyArtist = results
                }.store(in: &anyCancellables)
                
                
            } catch {
                
            }
        }
    }
    
}
