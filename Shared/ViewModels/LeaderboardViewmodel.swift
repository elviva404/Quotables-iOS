//
//  LeaderboardViewmodel.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 15/05/2022.
//

import Foundation

struct LeaderboardViewmodel {

    var feed = [Leaderboard]()

    init() {
        feed = [
            Leaderboard(
                username: "auntieX",
                quote: Quote(
                    quote: "Morse Code",
                    artist: "Medikal",
                    song: "Bele",
                    isFeatured: true
                ),
                points: 31,
                position: 1
            ),
            Leaderboard(
                username: "cousin_41",
                quote: Quote(
                    quote: "You wish",
                    artist: "Lil Wayne",
                    song: "Shooting Stars",
                    isFeatured: true
                ),
                points: 31,
                position: 2
            ),
            Leaderboard(
                username: "longsleaves_99",
                quote: Quote(
                    quote: "I'm always on the rise like stew",
                    artist: "Teephlow",
                    isFeatured: true
                ),
                points: 31,
                position: 3
            ),
            Leaderboard(
                username: "raa_909",
                quote: Quote(
                    quote: "I'm beam on the rise like stew",
                    artist: "Teephlow",
                    isFeatured: true
                ),
                points: 31,
                position: 4
            ),
        ]
    }
}
