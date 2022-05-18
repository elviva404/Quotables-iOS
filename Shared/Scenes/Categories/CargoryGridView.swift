//
//  CargoryGridView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 15/05/2022.
//

import SwiftUI

struct CargoryGridView: View {

    var quotes: [Quote]

    var body: some View {
        Section {
            ForEach(quotes, id: \.quote) { quote in
                NavigationLink(
                    destination: CategoryItemView()) {
                        CategoryItemView()
                            .aspectRatio(1.78, contentMode: .fit)
                    }
            }
        }
    }
}

struct CargoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CargoryGridView(
            quotes: [
                Quote(
                    quote: "Get Money",
                    artist: "Lil Kim"
                )
            ]
        )

    }
}
