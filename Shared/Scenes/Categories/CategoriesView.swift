//
//  CategoriesView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 15/05/2022.
//

import SwiftUI

struct CategoriesView: View {

    var featuredColumns: [GridItem] {
        [
            GridItem(.adaptive(minimum: 171, maximum: 181)),
            GridItem(.adaptive(minimum: 171, maximum: 181)),
        ]
    }

    var quotes = [
        Quote(
            quote: "Get Money",
            artist: "Lil Kim"
        ),
        Quote(
            quote: "Get asd",
            artist: "Lil Kim"
        ),
        Quote(
            quote: "Get Monsfasfey",
            artist: "Lil Kim"
        ),
        Quote(
            quote: "Get fasf",
            artist: "Lil Kim"
        ),
        Quote(
            quote: "Get fasiif",
            artist: "Lil Kim"
        ),
        Quote(
            quote: "Get skdd",
            artist: "Lil Kim"
        ),
        Quote(
            quote: "Get sdk",
            artist: "Lil Kim"
        ),
        Quote(
            quote: "Gaet sdsdd",
            artist: "Lil Kim"
        ),
        Quote(
            quote: "dsad dosa",
            artist: "Lil Kim"
        ),
        Quote(
            quote: "dsad dosa",
            artist: "Lil Kim"
        )
    ]

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                MoodHeaderView(moods: ["Mood", "Genre"])
                    .frame(height: 40, alignment: .center)
                    .padding(.vertical, 16)
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(
                        columns: featuredColumns,
                        alignment: .center,
                        spacing: 16
                    ) {
                        CargoryGridView(quotes: quotes)
                    }
                }
            }
            .padding(.horizontal, 16)
            .navigationBarTitle(Text("Categories"))
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
