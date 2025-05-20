//
//  ArtistCellView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 19/05/2022.
//

import SwiftUI

struct ArtistCellView: View {
    
    var artist: Artist?
    var spotifyArtist: SpotifyArtist?
    
    var body: some View {
        HStack {
            Image("categoryItemImage")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color.orange.opacity(0.5))
                .clipShape(Circle())
            Text(spotifyArtist?.name ?? "")
        }.padding()
    }

    init(spotifyArtist: SpotifyArtist? = nil) {
        self.artist = nil
        self.spotifyArtist = spotifyArtist
    }
}

struct ArtistCellView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistCellView(spotifyArtist: SpotifyArtist(id: "1", name: "Elikem", imageURL: "udasd"))
    }
}
