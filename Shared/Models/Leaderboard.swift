//
//  Profile.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 15/05/2022.
//

import Foundation

struct Leaderboard: Identifiable {
    var username: String = ""
    var quote = Quote()
    var points: Int = 0
    var position: Int = 1
    var id: String { UUID().uuidString }
}
