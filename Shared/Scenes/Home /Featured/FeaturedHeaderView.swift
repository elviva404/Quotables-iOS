//
//  FeatureHeaderView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 12/12/21.
//

import SwiftUI

struct FeaturedHeaderView: View {

    let theme = ThemeManager.current

    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .frame(width: 48, height: 48, alignment: .center)
                .background(Color.green.opacity(0.5))
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("Pseudo Name")
                Text("Position")
                    .font(theme.bodyFont)
                    .foregroundColor(Color("subTitleColor"))
            }
            Spacer()
            Image("verifiedIcon")
        }
    }
}

struct FeatureHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedHeaderView()
    }
}
