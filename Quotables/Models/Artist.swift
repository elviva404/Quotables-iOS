//
//  Artist.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 06/03/2022.
//

import Foundation

struct Artist: Codable, Identifiable {
    var id: Int?
    var name: String?
    let category: Int?
    let profileImageURL: String?
    let spotifyURL: String?
    let spotifyId: String?

    enum CodingKeys: String, CodingKey {
        case id, name, category
        case profileImageURL = "profile_image_url"
        case spotifyURL = "spotify_url"
        case spotifyId = "spotify_id"
    }

    init(
        id: Int? = nil,
        name: String?,
        category: Int? = nil,
        profileImageURL: String? = nil,
        spotifyURL: String? = nil,
        spotifyId: String? = nil
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.profileImageURL = profileImageURL
        self.spotifyURL = spotifyURL
        self.spotifyId = spotifyId
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
    var itemName: String?
    var imageURL: String?
    var type: MediaType?
    var spotifyId: String?
    var spotifyURL: String?

    var name: String {
        return itemName ?? ""
    }

    var url: String? {
        return imageURL
    }

    var toArtist: Artist {
        return Artist(
            name: itemName,
            profileImageURL: imageURL,
            spotifyURL: spotifyURL,
            spotifyId: spotifyId
        )
    }

    enum CodingKeys: String, CodingKey {
        case id
        case itemName = "name"
        case imageURL = "image_url"
        case type = "media_type"
        case spotifyId = "spotify_artist_id"
        case spotifyURL = "spotify_url"
    }
}
