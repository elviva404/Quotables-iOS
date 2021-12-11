//
//  MainTabView.swift
//  MainTabView
//
//  Created by Elikem-OZE on 24/10/2021.
//

import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house.fill")
                    .resizable()
                Text("Home")
            }
            HomeView().tabItem {
                Image(systemName: "scroll")
                    .resizable()
                Text("Leaderboard")
            }
            ComposeView().tabItem {
                Image(systemName: "plus")
                    .resizable()
                Text("Add Quote")
            }
            HomeView().tabItem {
                Image(systemName: "music.mic")
                    .resizable()
                Text("Artists")
            }
            HomeView().tabItem {
                Image(systemName: "square.grid.3x3.topleft.filled")
                    .resizable()
                Text("Categories")
            }
        }.accentColor(.yellow)
    }

}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
