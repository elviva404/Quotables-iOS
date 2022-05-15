//
//  HomeViewModel.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 2/1/22.
//

import Foundation

enum HomeSection: String {
    case featured
    case trending
    case recent
    case moods
}

struct FeedItem: Identifiable {
    var section: HomeSection
    var quotes: [Quote]
    var id: String { section.rawValue }
}

struct HomeViewModel {
    
    var featuredQuotes = [Quote]()
    var trendingQuotes = [Quote]()
    var recentQuotes = [Quote]()
    var moods = [Quote]()

    var feed: [FeedItem]
    
    init() {
        featuredQuotes = [
            Quote(
                quote: "Morse Code",
                artist: "Medikal",
                song: "Bele",
                isFeatured: true
            ),
            Quote(
                quote: "Fuck Bitches, Get Money",
                artist: "Lil Kim",
                song: "Get Money",
                isFeatured: true
            ),
            Quote(
                quote: "You wish",
                artist: "Lil Wayne",
                song: "Shooting Stars",
                isFeatured: true
            )
        ]

        trendingQuotes = [
            Quote(
                quote: "I'm always on the rise like stew",
                artist: "Teephlow",
                isFeatured: true
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

        recentQuotes = [
            Quote(
                quote: "I love you",
                artist: "Celine Dionee",
                song: "La Hustle"
            ),
            Quote(
                quote: "Bimbila",
                artist: "Sa",
                song: "La Hustle"
            )
        ]

        moods = [
            Quote(
                quote: "I'm always on the rise like stew",
                artist: "Teephlow",
                isFeatured: true
            ),
            Quote(
                quote: "Bimbila",
                artist: "Sa",
                song: "La Hustle"
            )
        ]
    
        feed = [
            FeedItem(section: .featured, quotes: featuredQuotes),
            FeedItem(section: .trending, quotes: trendingQuotes),
            FeedItem(section: .recent, quotes: recentQuotes),
            FeedItem(section: .moods, quotes: moods)
        ]
    }
}
