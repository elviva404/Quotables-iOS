//
//  Artist.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 06/03/2022.
//

import Foundation

struct Artist: Codable, Identifiable {
    let id: Int?
    let name: String?
    let category: Int?
    let profileImageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name, category
        case profileImageURL = "profile_image_url"
    }

    init(id: Int?, name: String?, category: Int? = nil, profileImageURL: String? = nil) {
        self.id = id
        self.name = name
        self.category = category
        self.profileImageURL = profileImageURL
    }
}

struct SpotifyArtist: Codable, Searchable, Identifiable {

    public enum MediaType: Int, Codable {
        case artist
        case track
        case genre
        case mood
    }

    var id: String?
    var name: String?
    var imageURL: String?
    var type: MediaType?
    var spotifyId: String?
    
    var url: String? {
        return imageURL
    }

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case type = "media_type"
        case spotifyId = "spotify_id"
    }
}
