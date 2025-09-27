//
//  Genre.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 19/05/2022.
//

import Foundation

struct Genre: Codable, Identifiable {
    var id = UUID()
    var name = String()
    var imageURLString = String()
}
