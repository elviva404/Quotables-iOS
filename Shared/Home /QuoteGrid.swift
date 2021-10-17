//
//  QuoteGrid.swift
//  Quotables (iOS)
//
//  Created by Elikem-OZE on 10/10/2021.
//

import SwiftUI

struct QuoteGrid: View {

    var title: String
    var isFeatured: Bool = false
    var quotes: [Quote]
    
    var body: some View {
        
        if !isFeatured {
            Section(
                header: categoryHHeader(with: title)
            ) {
                ForEach(quotes, id: \.quote) { quote in
                    NavigationLink(
                        destination: FeaturedView(quote: quote)) {
                            FeaturedView(quote: quote)
                                .frame(
                                    width: UIScreen.main.bounds.width - 32,
                                    height: 140,
                                    alignment: .leading
                                )
                        }
                }
            }
        } else {
            Section {
                ForEach(quotes, id: \.quote) { quote in
                    NavigationLink(
                        destination: FeaturedView(quote: quote)) {
                            FeaturedView(quote: quote)
                                .frame(
                                    width: UIScreen.main.bounds.width - 32,
                                    height: 140,
                                    alignment: .leading
                                )
                        }
                }
            }
        }
    }
    
    private func categoryHHeader(with header: String) -> some View {
        Text(header)
            .bold()
            .frame(minWidth: 70)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .cornerRadius(16)
            .padding(.horizontal)
    }

    private func emptyHeader() -> some View {
         EmptyView()
    }
    
}

struct QuoteGrid_Previews: PreviewProvider {
    static var previews: some View {
        QuoteGrid(
            title: "Hello",
            quotes: [
                Quote(quote: "Get Money", artist: "Lil Kim")
            ]
        )
    }
}
