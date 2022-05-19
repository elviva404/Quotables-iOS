//
//  ArtistCellView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 19/05/2022.
//

import SwiftUI

struct ArtistCellView: View {
    var body: some View {
        HStack {
            Image("categoryItemImage")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color.orange.opacity(0.5))
                .clipShape(Circle())
            Text("Drake")
        }.padding()
    }
}

struct ArtistCellView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistCellView()
    }
}
