//
//  FeaturedFooterView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 12/12/21.
//

import SwiftUI

struct FeaturedFooterView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Artist Name")
                .font(.subheadline)
                .bold()
                .foregroundColor(Color("lightColor"))
            Text("Song")
                .font(.footnote)
                .foregroundColor(Color("lightColor"))
        }
    }
}

struct FeaturedFooterView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedFooterView()
    }
}
