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
                Image("homeTabIcon")
                    .resizable()
            }
//            GenerateView().tabItem {
//                Image("generateTabIcon")
//                    .resizable()
//            }
            ComposeView().tabItem {
                Image("composeTabIcon")
                    .resizable()
            }
//            LeaderboardView().tabItem {
//                Image("leaderboardTabIcon")
//                    .resizable()
//            }
            CategoriesView().tabItem {
                Image("categoriesTabIcon")
                    .resizable()
            }
        }.accentColor(.yellow)
    }

}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
