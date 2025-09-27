//
//  Song.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 19/05/2022.
//

import Foundation

struct Song: Codable, Identifiable {

    var id: String { UUID().uuidString }
    var name = String()
    var artist: Artist?
    var genre: Genre?
    var artworkURL = String()
    
}
