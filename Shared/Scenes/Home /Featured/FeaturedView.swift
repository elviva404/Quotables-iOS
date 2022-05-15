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
        VStack {
            VStack(spacing: 16) {
                FeaturedHeaderView()
                Text("Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote")
                    .frame(alignment: .center)
                //                .frame(height: 400)
                    .font(.body)
                HStack {
                    FeaturedFooterView()
                    Spacer()
                }
            }
            .padding(16)
            .clipped()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.green, lineWidth: 2)
            )
            FeaturedAuthorView()
        }
    }
    
}

struct FeaturedView_Previews: PreviewProvider {
    
    static var width: CGFloat {
        return UIScreen.main.bounds.width - 48
    }

    static var previews: some View {
        FeaturedView(
            quote: Quote(
                quote: "Kink",
                artist: "lil K",
                song: "Song",
                isFeatured: true
            )
        )
    }
}
