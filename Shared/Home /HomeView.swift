//
//  HomeView.swift
//  Quotables
//
//  Created by Elikem-OZE on 24/07/2021.
//

import SwiftUI

struct HomeView: View {
    
    var featuredColumns: [GridItem] {
        [
            GridItem(.fixed(200))
        ]
    }

    var regularColumns: [GridItem] {
        [
            GridItem(.fixed(UIScreen.main.bounds.width))
        ]
    }

    var quotes: [Quote] {
        [
            Quote(quote: "Get Money", artist: "Lil Kim", isFeatured: true),
            Quote(quote: "These girls only love you when you are winning", artist: "Weeknd"),
            Quote(quote: "You wish", artist: "Lil Wayne", isFeatured: true),
            Quote(quote: "Get il", artist: "Lil Kim"),
            Quote(quote: "Pinkie", artist: "Weeknd"),
            Quote(quote: "Phase 2", artist: "Lil Wayne", isFeatured: true)
        ]
    }
    
    var body: some View {
        
        ScrollView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHGrid(
                        rows: featuredColumns,
                        alignment: .firstTextBaseline,
                        spacing: 16) {
                            QuoteGrid(
                                title: "Featured",
                                isFeatured: true,
                                quotes: quotes.filter({$0.isFeatured})
                            )
                        }
                }
                LazyVGrid(
                    columns: regularColumns,
                    spacing: 16
                ) {
                    QuoteGrid(
                        title: "Regular",
                        quotes: quotes.filter({!$0.isFeatured})
                    )
                    
                }
            }
            
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
