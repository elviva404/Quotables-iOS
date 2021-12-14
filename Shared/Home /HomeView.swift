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
            Quote(
                quote: "Fuck Bitches, Get Money",
                artist: "Lil Kim",
                song: "Get Money",
                isFeatured: true
            ),
            Quote(
                quote: "These girls only love you when you are winning",
                artist: "Weeknd",
                song: "Try Me"
            ),
            Quote(
                quote: "You wish",
                artist: "Lil Wayne",
                song: "Shooting Stars",
                isFeatured: true
            ),
            Quote(
                quote: "Get into it",
                artist: "Bong",
                song: "Ty Stars"
            ),
            Quote(
                quote: "La hustle o, nye sa la wu",
                artist: "Medikal",
                song: "La Hustle"
            ),
            Quote(
                quote: "I'm always on the rise like stew",
                artist: "Teephlow",
                isFeatured: true
            ),
            Quote(
                quote: "I love you",
                artist: "Celine Dionee",
                song: "La Hustle"
            ),
            Quote(
                quote: "Bimbila",
                artist: "Sa",
                song: "La Hustle"
            ),
            Quote(
                quote: "Fear",
                artist: "Medikal",
                song: "La Hustle"
            ),
        ]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Featured")
                        .font(.title)
                        .bold()
                        .frame(
                            minWidth: 30,
                            maxHeight: 40,
                            alignment: .leading
                        )
                        .padding(.leading, 16)
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
                    .frame(maxHeight: 140, alignment: .center)
                    .padding(.leading, 16)
                    
                    LazyVGrid(
                        columns: regularColumns,
                        spacing: 8
                    ) {
                        QuoteGrid(
                            title: "Regular",
                            quotes: quotes.filter({!$0.isFeatured})
                        )
                        
                    }
                }
            }
            .navigationBarItems(
                leading: HStack {
                    Text("Greeting")
                        .bold()
                },
                trailing: HStack(spacing: 16) {
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                    }
                    Image(systemName: "person.fill")
                        .frame(width: 40, height: 40)
                        .background(Color.green.opacity(0.5))
                        .clipShape(Circle())
                }
            )
            .navigationBarTitle(Text("Browse Quotes"))
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
