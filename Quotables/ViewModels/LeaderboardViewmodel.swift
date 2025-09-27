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
                    id: -2,
                    quote: "Morse Code",
                    songTitle: "Bele",
                    artist: Artist(id: -2, name: "Medikal"),
                    isFeatured: true
                ),
                points: 31,
                position: 1
            ),
            Leaderboard(
                username: "cousin_41",
                quote: Quote(
                    id: -31,
                    quote: "You wish",
                    songTitle: "Shooting Stars",
                    artist: Artist(id: -5, name: "Lil Wayne"),
                    isFeatured: true
                ),
                points: 31,
                position: 2
            ),
            Leaderboard(
                username: "longsleaves_99",
                quote: Quote(
                    id: -52,
                    quote: "I'm always on the rise like stew",
                    songTitle: "BMW",
                    artist: Artist(id: -5, name:"Teephlow"),
                    isFeatured: true
                ),
                points: 31,
                position: 3
            ),
            Leaderboard(
                username: "raa_909",
                quote: Quote(
                    id: -524,
                    quote: "I'm am on the rise like stew",
                    songTitle: "gingz",
                    artist: Artist(id: -5, name: "Teephlow"),
                    isFeatured: true
                ),
                points: 31,
                position: 4
            ),
        ]
    }
}
