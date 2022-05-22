//
//  QuoteListView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 19/05/2022.
//

import SwiftUI

struct QuoteListView: View {
    
    var shuffleResults: [Quote] {
        var quotes = [Quote]()
        for _ in 0 ..< 20 {
            quotes.append(Quote(quote: "holla", artist: "jins", song: "sfw", isFeatured: true))
        }
        return quotes
    }
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(shuffleResults) { quote in
                        FeaturedView(quote: quote)
                            .padding(.vertical, 16)
                    }
                }
                ButtonView(config: ButtonView.Configuration(title: "Shuffle Again", textColor: .purple, backgroundColor: .gray))
            }
            .navigationTitle("Top Results")
        }
    }
}

struct QuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteListView()
    }
}
