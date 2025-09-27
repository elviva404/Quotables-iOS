//
//  ProfileCellView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 15/05/2022.
//

import SwiftUI

struct ProfileCellView: View {

    var leaderboard: Leaderboard!

    var isNumber1: Bool {
        return leaderboard.position == 1
    }

    var imageLength: CGFloat {
        return isNumber1 ? 64 : 48
    }

    var trophyImageLength: CGFloat {
        return isNumber1 ? 24 : 16
    }

    var offset: CGFloat {
        return isNumber1 ? 20 : 15
    }

    var shouldShowTrophy: Bool {
        return leaderboard.position <= 3
    }

    var body: some View {
        HStack {
            Text("\(leaderboard.position)")
            ZStack {
                Image(systemName: "person.fill")
                    .frame(width: imageLength, height: imageLength, alignment: .center)
                    .background(Color.orange.opacity(0.5))
                    .clipShape(Circle())
                if shouldShowTrophy {
                    Image(systemName: "crown.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: trophyImageLength, height: trophyImageLength, alignment: .center)
                        .background(Color.red.opacity(0.5))
                        .clipShape(Circle())
                        .offset(x: offset, y: offset)
                }
            }
            
            VStack(alignment: .leading) {
                Text(leaderboard.username)
                    .bold()
                Text(leaderboard.quote?.quote ?? "")
            }
            
            Spacer()
            
            VStack(alignment: .center) {
                Text("\(leaderboard.points)\npts")
            }
        }
    }

}

struct ProfileCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCellView(
            leaderboard: Leaderboard(
                username: "f9f9f9",
                quote: Quote.testQuote,
                points: 20
            )
        )
    }
}
