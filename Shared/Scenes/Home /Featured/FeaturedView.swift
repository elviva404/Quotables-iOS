//
//  FeaturedView.swift
//  Quotables
//
//  Created by Elikem-OZE on 24/07/2021.
//

import SwiftUI

enum QuoteViewUsage {
    case normal
    case share
}

struct FeaturedView: View {

    var quote: Quote!
    let theme = ThemeManager.current
    var usage: QuoteViewUsage = .normal
    @State var isPresented = false

    var quotedQuote: String {
        return "\u{22}\(quote.quote)\u{22}"
    }

    var body: some View {
        VStack {
            VStack(spacing: 16) {
                FeaturedHeaderView()
                Text("Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote Quote")
                    .frame(alignment: .center)
                    .font(theme.bodyFont)
                HStack {
                    switch usage {
                    case .normal:
                        FeaturedFooterView()
                    case .share:
                        FeaturedShareFooterView()
                    }
                    Spacer()
                }
            }
            .padding(16)
            .clipped()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.green, lineWidth: 2)
            )
            .onTapGesture {
                isPresented = !isPresented
            }.sheet(isPresented: $isPresented) {
                ShareView()
            }
            if usage == .normal {
                FeaturedAuthorView()
            }
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
