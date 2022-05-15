//
//  DropdownSearchView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 06/03/2022.
//

import SwiftUI

struct DropdownSearchView: View {

    var searchResults = [Artist]()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                Text("Search")
                Spacer()
                Image(systemName: "xmark.circle.fill")
            }
            List(searchResults) {
                Text($0.name)
            }
            .padding(.vertical, -6)
        }
        .padding(.horizontal, 8)
    }
}

struct DropdownSearchView_Previews: PreviewProvider {
    static var previews: some View {
        let searches = [
            Artist(name: "Drake"),
            Artist(name: "Kanye"),
            Artist(name: "Kidi")
        ]
        DropdownSearchView(searchResults: searches)
    }
}
