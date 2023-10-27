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
    case featured
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
            VStack(alignment: .leading, spacing: 16) {
                if usage != .normal {
                    FeaturedHeaderView(quote: quote)
                } else if usage == .share {
                    ShareHeaderView(quote: quote)
                }

                Text(quote.quote)
                    .multilineTextAlignment(.leading)
                    .font(usage != .featured ? .title2.weight(.semibold) : .title.weight(.semibold))
                    .foregroundColor(Color.black)
                    .minimumScaleFactor(0.5)
                HStack {
                    switch usage {
                    case .normal, .featured:
                        FeaturedFooterView(quote: quote)
                    case .share:
                        FeaturedShareFooterView(quote: quote)
                    }
                    Spacer()
                }
            }
            .padding(16)
            .clipped()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(theme.black_20, lineWidth: 0.5)
                    .shadow(color: .black, radius: 4, x: 4, y: 4)
            )
            .onTapGesture {
                isPresented = !isPresented
            }.sheet(isPresented: $isPresented) {
                ShareView(quote: quote)
            }
            if usage == .normal {
                FeaturedAuthorView(quote: quote)
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
            quote: Quote.testQuote,
            usage: .normal
        )

        FeaturedView(
            quote: Quote.testQuote,
            usage: .share
        )
    }
}
