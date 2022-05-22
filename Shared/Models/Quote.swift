//
//  Quote.swift
//  Quotables (iOS)
//
//  Created by Elikem-OZE on 10/10/2021.
//

import Foundation

struct Quote: Identifiable {
    var id: String { return UUID().uuidString }
    var quote = String()
    var artist = String()
    var song = String()
    var isFeatured: Bool = false
    
    static var testQuote: Quote {
        return Quote(
            quote: "Kink",
            artist: "lil K",
            song: "Song",
            isFeatured: true
        )
    }
}
