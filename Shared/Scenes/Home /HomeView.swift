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
            GridItem(.fixed(200)),
        ]
    }

    var feed = HomeViewModel().feed

    var body: some View {
        
        NavigationView {
            ScrollView {
                Spacer()
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(feed) { index in
                        Text(index.section.rawValue.capitalized)
                            .font(.title)
                            .bold()
                            .padding(.leading, 16)
                        if index.section == .moods {
                            MoodHeaderView()
                                .frame(maxHeight: 40, alignment: .center)
                                .padding(.top, 16)
                                .padding(.leading, 16)
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(
                                rows: featuredColumns,
                                alignment: .center,
                                spacing: 16
                            ) {
                                QuoteGrid(
                                    title: index.section.rawValue,
                                    quotes: index.quotes
                                )
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        .padding(.leading, 16)
                        .padding(.top, -16)
                        
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
