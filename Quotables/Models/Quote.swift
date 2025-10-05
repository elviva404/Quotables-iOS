//
//  Quote.swift
//  Quotables (iOS)
//
//  Created by Elikem-OZE on 10/10/2021.
//

import Foundation

struct Quote: Codable, Identifiable {

    let id: Int
    var quote, songTitle: String?
    let artist: Artist?
    let contributor: Contributor?
    let category: Category?
    let mood: [Mood]?
    let appleMusicURL, spotifyURL: String?
    let likes, viewers, shareCount: Int?
    let trendMeter: Double?
    let verified: Bool?
    let isFeatured: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, quote
        case songTitle = "song_title"
        case artist, contributor, category, mood
        case appleMusicURL = "apple_music_url"
        case spotifyURL = "spotify_url"
        case likes, viewers
        case shareCount = "share_count"
        case trendMeter = "trend_meter"
        case verified
        case isFeatured = "is_featured"
    }

    init(
        id: Int? = nil,
        quote: String? = nil,
        songTitle: String? = nil,
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
        isFeatured: Bool,
        verified: Bool = false
    ) {
//        self.id = id
        self.id = 0
        self.isFeatured = isFeatured
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
        self.verified = verified
    }
    
    static var testQuote: Quote {
        return Quote(
//            id: -1,
            quote: "I'm always on the rise like stew",
            songTitle: "Sugar",
            artist: Artist(id: -2, name: "Drake", category: -1, profileImageURL: nil),
            contributor: Contributor(id: -1, email: "elviva", name: "Elikem"),
            isFeatured: true
        )
    }
    
    static var testQuote2: Quote {
        return Quote(
//            id: -1,
            quote: "I'm always on the rise like stew",
            songTitle: "Sugar",
            artist: Artist(id: -2, name: "Drake", category: -1, profileImageURL: nil),
            contributor: Contributor(id: -1, email: "elviva", name: "Elikem"),
            isFeatured: true
        )
    }

    var asDict: [String: Any] {
        var param: [String: Any] = [:]
        
        if let quote = quote {
            param["quote"] = quote
        }
        if let songTitle = songTitle {
            param["song_title"] = songTitle
        }
        if let artist = artist {
            param["artist"] = [
                "name": artist.name ?? "",
                "spotify_id": artist.spotifyId ?? "",
//                "profile_image_url": artist.profileImageURL ?? "",
                "spotify_url": artist.spotifyURL ?? ""
            ]
        }
//        if let contributor = contributor {
            param["contributor_id"] = 2
//        }
//        if let category = category {
            param["category_id"] = 1
//        }
//        if let mood = mood {
//            param["mood_ids"] = mood.map { $0.id }
        param["mood_ids"] = [1,3].map { $0 }
//        }
        if let appleMusicURL = appleMusicURL {
            param["apple_music_url"] = appleMusicURL
        }
        if let spotifyURL = spotifyURL {
            param["spotify_url"] = spotifyURL
        }
        
        return param
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

    init(id: Int? = nil, email: String? = nil, name: String? = nil) {
        self.id = id
        self.email = email
        self.name = name
    }
}

// MARK: - Mood
struct Mood: Codable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
}
