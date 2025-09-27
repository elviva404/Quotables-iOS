//
//  LeaderboardView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 15/05/2022.
//

import SwiftUI

struct LeaderboardView: View {
    
    var feed = LeaderboardViewmodel().feed

    var body: some View {
        
        NavigationView {
            List {
                ForEach(feed) { profile in
                    ProfileCellView(leaderboard: profile)
                }
            }
            .navigationBarTitle(Text("Leaderboard"))
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
