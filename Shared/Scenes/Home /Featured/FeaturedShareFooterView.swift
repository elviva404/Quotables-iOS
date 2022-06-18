//
//  FeaturedShareFooterView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 05/06/2022.
//

import SwiftUI

struct FeaturedShareFooterView: View {

    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .frame(width: 24, height: 24, alignment: .center)
                .background(Color.orange.opacity(0.5))
                .clipShape(Circle())
            Text("Pseudo Name")
            Spacer()
            Image("shareAppLogo")
        }
        .padding(.top, 8)
        .padding(.leading, 16)
    }
}

struct FeaturedShareFooterView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedShareFooterView()
    }
}
