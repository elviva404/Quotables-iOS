//
//  Quote.swift
//  Quotables (iOS)
//
//  Created by Elikem-OZE on 10/10/2021.
//

import Foundation

struct Quote: Codable, Identifiable {
    var isFeatured: Bool = false
    
    let id: Int
    let quote, songTitle: String
    let artist: Artist?
    let contributor: Contributor?
    let category: Category?
    let mood: [Mood]?
    let appleMusicURL, spotifyURL: String?
    let likes, viewers, shareCount: Int?
    let trendMeter: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, quote
        case songTitle = "song_title"
        case artist, contributor, category, mood
        case appleMusicURL = "apple_music_url"
        case spotifyURL = "spotify_url"
        case likes, viewers
        case shareCount = "share_count"
        case trendMeter = "trend_meter"
    }

    init(
        id: Int,
        quote: String,
        songTitle: String,
        artist: Artist? = nil,
        contributor: Contributor? = nil,
        category: Category? = nil,
        mood: [Mood]? = nil,
        appleMusicURL: String? = nil,
        spotifyURL: String? = nil,
        likes: Int? = nil,
        viewers: Int? = nil,
        shareCount: Int? = nil,
        trendMeter: Double? = nil,
        isFeatured: Bool
    ) {
        self.isFeatured = isFeatured
        self.id = id
        self.quote = quote
        self.songTitle = songTitle
        self.artist = artist
        self.contributor = contributor
        self.category = category
        self.mood = mood
        self.appleMusicURL = appleMusicURL
        self.spotifyURL = spotifyURL
        self.likes = likes
        self.viewers = viewers
        self.shareCount = shareCount
        self.trendMeter = trendMeter
    }
    
    static var testQuote: Quote {
        return Quote(
            id: -1,
            quote: "Kink",
            songTitle: "Sugar",
            artist: Artist(id: -2, name: "Drake", category: -1, profileImageURL: nil),
            isFeatured: true
        )
    }
}



struct Category: Codable {
    let id: Int?
    let name: String?
    let quotes: [Quote]?

    init(id: Int?, name: String?, quotes: [Quote]? = nil) {
        self.id = id
        self.name = name
        self.quotes = quotes
    }
}

// MARK: - Contributor
struct Contributor: Codable {
    let id: Int?
    let email, name: String?
}

// MARK: - Mood
struct Mood: Codable {
    let id: Int?
    let name: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
}
