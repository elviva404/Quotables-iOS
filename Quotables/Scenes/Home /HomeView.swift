//
//  HomeView.swift
//  Quotables
//
//  Created by Elikem-OZE on 24/07/2021.
//

import SwiftUI
import Combine

struct HomeView: View {


    @StateObject var viewmodel = HomeViewModel()
    @State var selectedIndex: Int = 0

    var body: some View {
        
        NavigationView {
            VStack {
                ScrollViewReader { proxy in
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                        ForEach(viewmodel.moods.indices, id: \.self) { i in
                                Text(viewmodel.moods[i].name)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(selectedIndex == i ? Color.black : Color.gray.opacity(0.2))
                                    .foregroundColor(selectedIndex == i ? .white : .black)
                                    .clipShape(Capsule())
                                    .id(i)
                                    .onTapGesture {
                                        selectedIndex = i
                                        self.viewmodel.fetchQuotes(byMood: viewmodel.moods[i])
                                    }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .onChange(of: selectedIndex) { newIndex in
                        withAnimation {
                            proxy.scrollTo(newIndex, anchor: .center)
                        }
                    }
                }

                TabView(selection: $selectedIndex) {
                    ForEach(viewmodel.moods.indices, id: \.self) { i in
                        ScrollView {
                            LazyVStack(alignment: .leading, spacing: 0) {
                                ForEach(Array(viewmodel.quotes), id: \.id) { quote in
                                    NavigationLink(
                                        destination: FeaturedView(quote: quote)) {
                                            FeaturedView(quote: quote, usage: .normal)
                                                .onAppear {
                                                    if viewmodel.isLast(quote: quote) {
                                                        self.viewmodel.fetchQuotes(byMood: viewmodel.moods[selectedIndex], shouldFetchMore: true)

                                                    }
                                                }
                                        }
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                        .tag(i)
                        
                    }
                    .refreshable {
                        viewmodel.fetchQuotes(shouldRefresh: true)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
            }
            
        }
        .onAppear {
            viewmodel.fetchMoods()
            viewmodel.fetchQuotes(shouldFetchMore: true)
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
