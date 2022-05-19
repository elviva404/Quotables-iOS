//
//  Artist.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 06/03/2022.
//

import Foundation

struct Artist: Codable, Identifiable {
    var id = UUID()
    var name = String()
    var imageURLString = String()
}
