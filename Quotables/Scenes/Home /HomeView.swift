//
//  HomeView.swift
//  Quotables
//
//  Created by Elikem-OZE on 24/07/2021.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    var featuredColumns: [GridItem] {
        [
            GridItem(.fixed(200)),
        ]
    }

    @StateObject var viewmodel = HomeViewModel()
    
    var width: CGFloat {
        return UIScreen.main.bounds.width - 48
    }

    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(Array(viewmodel.quotes), id: \.id) { quote in
                        NavigationLink(
                            destination: FeaturedView(quote: quote)) {
                                FeaturedView(quote: quote, usage: .normal)
                                    .onAppear {
                                        if viewmodel.isLast(quote: quote) {
                                            viewmodel.fetchQuotes(shouldFetchMore: true)
                                        }
                                    }
                            }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .refreshable {
                viewmodel.fetchQuotes(shouldRefresh: true)
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
//            .navigationBarTitle(Text("Browse Quotes"))
        }
        .onAppear {
            viewmodel.fetchQuotes(shouldFetchMore: true)
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
