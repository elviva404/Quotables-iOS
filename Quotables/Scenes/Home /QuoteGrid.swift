//
//  QuoteGrid.swift
//  Quotables (iOS)
//
//  Created by Elikem-OZE on 10/10/2021.
//

import SwiftUI

struct QuoteGrid: View {

    var title: String
    var usage: QuoteViewUsage = .normal
    var quotes: [Quote]
    
    var width: CGFloat {
        return UIScreen.main.bounds.width - 48
    }
    
    var minHeight: CGFloat {
        return 50
    }

    var fetchMore: (() -> Void)?

    var body: some View {
        
        Section {
            ForEach(quotes, id: \.quote) { quote in
                NavigationLink(
                    destination: FeaturedView(quote: quote)) {
                        FeaturedView(quote: quote, usage: usage)
                            .frame(
                                minWidth: width,
                                idealWidth: width,
                                maxWidth: width,
                                alignment: .leading
                            )
                            .onAppear{
                                if quote.id == quotes.last?.id {
                                    print("❌ is last\\: Fetching more ...")
                                    fetchMore?()
                                }
                            }
                    }
            }
        }
    }
    
    private func categoryHHeader(with header: String) -> some View {
        Text(header)
            .bold()
            .frame(maxWidth: 70)
            .frame(maxWidth: 70, maxHeight: .infinity, alignment: .center)
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
                Quote.testQuote,
            ]
        )
    }
}
