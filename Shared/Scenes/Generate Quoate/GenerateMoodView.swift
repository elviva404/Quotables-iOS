//
//  GenerateMoodView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 19/05/2022.
//

import SwiftUI

struct GenerateMoodView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Pick a mood")
            MoodHeaderView(moods: ["Happy", "Hours", "Sad", "Sarry", "Wink-ey"])
        }
    }
}

struct GenerateMoodView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateMoodView()
    }
}
