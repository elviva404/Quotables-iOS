//
//  FeaturedView.swift
//  Quotables
//
//  Created by Elikem-OZE on 24/07/2021.
//

import SwiftUI

struct FeaturedView: View {

    var quote: Quote!

    var quotedQuote: String {
        return "\u{22}\(quote.quote)\u{22}"
    }
    var body: some View {

        VStack(alignment: .leading) {
            Text(quotedQuote)
                .font(.title)
                .bold()
                .foregroundColor(.green)
                .padding(.horizontal, 8)
                .padding(.top, 8)
            Text(quote.artist)
                .font(.subheadline)
                .italic()
                .foregroundColor(.blue)
                .padding(.horizontal, 8)
            Text(quote.song)
                .font(.subheadline)
                .foregroundColor(.blue)
                .padding(.horizontal, 8)
                .padding(.bottom, 8)        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipped()
        .background(Color.yellow)
        .cornerRadius(16)

    }
    
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(
            quote: Quote(
                quote: "Kink",
                artist: "lil K",
                song: "Song",
                isFeatured: true)
        )
    }
}
