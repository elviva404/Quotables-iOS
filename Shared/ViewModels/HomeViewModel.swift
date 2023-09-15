//
//  HomeViewModel.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 2/1/22.
//

import Foundation
import Combine
import UIKit
import SwiftUI

enum HomeSection: String {
    case featured
    case normal
}

struct FeedItem: Identifiable {
    var section: HomeSection
    var quotes: [Quote]
    var id: String { section.rawValue }
}

final class HomeViewModel: ObservableObject {

    var quotes = [Quote]()

    @Published private(set) var feedpub = [FeedItem]()
    
    let quoteClient = QuoteClient()
    var anyCancellable = Set<AnyCancellable>()
    
    

     init() {
//        featuredQuotes = [
//            Quote(
//                quote: "Morse Code",
//                artist: "Medikal",
//                song: "Bele",
//                isFeatured: true
//            ),
//            Quote(
//                quote: "Fuck Bitches, Get Money",
//                artist: "Lil Kim",
//                song: "Get Money",
//                isFeatured: true
//            ),
//            Quote(
//                quote: "You wish",
//                artist: "Lil Wayne",
//                song: "Shooting Stars",
//                isFeatured: true
//            )
//        ]
//
//        trendingQuotes = [
//            Quote(
//                quote: "I'm always on the rise like stew",
//                artist: "Teephlow",
//                isFeatured: true
//            ),
//            Quote(
//                quote: "Bimbila",
//                artist: "Sa",
//                song: "La Hustle"
//            ),
//            Quote(
//                quote: "Fear",
//                artist: "Medikal",
//                song: "La Hustle"
//            ),
//        ]
//
//        recentQuotes = [
//            Quote(
//                quote: "I love you",
//                artist: "Celine Dionee",
//                song: "La Hustle"
//            ),
//            Quote(
//                quote: "Bimbila",
//                artist: "Sa",
//                song: "La Hustle"
//            )
//        ]
//
//        moods = [
//            Quote(
//                quote: "I'm always on the rise like stew",
//                artist: "Teephlow",
//                isFeatured: true
//            ),
//            Quote(
//                quote: "Bimbila",
//                artist: "Sa",
//                song: "La Hustle"
//            )
//        ]
    

//        super.init()
    }

     func fetchQuotes() {
        Task {
            let quotes = try await quoteClient.fetchQuotes()
            quotes.sink { error in
                print("❌ error", error)
            } receiveValue: { quotes in
                self.quotes = quotes
                self.filterQuotes(quotes)
            }.store(in: &anyCancellable)

        }
    }

    private func filterQuotes(_ quotes: [Quote]) {
        let featuredQuotes = quotes.filter({ $0.isFeatured })
        let normalQuotes = quotes.filter({ !$0.isFeatured })

        var feed = [FeedItem]()

        if !featuredQuotes.isEmpty {
            feed.append(FeedItem(section: .featured, quotes: featuredQuotes))
        }

        if !normalQuotes.isEmpty {
            feed.append(FeedItem(section: .normal, quotes: normalQuotes))
        }

        feedpub = feed
    }
}
