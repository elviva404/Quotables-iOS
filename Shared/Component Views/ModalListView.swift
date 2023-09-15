//
//  ModalListView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 18/05/2022.
//

import SwiftUI

struct ModalListView: View {
    
    enum Usage {
        case song
        case artist
        case genre
    }
    
    var usage: Usage = .song
    let items = Array(0..<100)
    @State var searchQuery = ""

    var songs: [Song] {
        var _songs = [Song]()
        for _ in items {
            _songs.append(Song())
        }
        return _songs
    }

    var artists: [Artist] {
        var _artists = [Artist]()
        for _ in items {
            _artists.append(Artist(id: nil, name: nil))
        }
        return _artists
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(songs) { item in
                    ArtistCellView()
                }
            }
            .listStyle(GroupedListStyle())
            .searchable(text: $searchQuery, prompt: "Search for Genre")
            .onSubmit(of: .search) {
                //                filterRecipes()
            }
            .onChange(of: searchQuery) { _ in
//                filterRecipes()
            }
            .navigationTitle("Select Genre")

        }
    }
}

struct ModalListView_Previews: PreviewProvider {
    static var previews: some View {
        ModalListView()
    }
}
