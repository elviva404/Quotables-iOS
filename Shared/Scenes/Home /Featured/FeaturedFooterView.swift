//
//  FeaturedFooterView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 12/12/21.
//

import SwiftUI

struct FeaturedFooterView: View {

    var quote: Quote!

    var body: some View {
        VStack(alignment: .leading) {
            Text(quote.artist?.name ?? "")
                .font(.subheadline)
                .bold()
                .foregroundColor(Color("lightColor"))
            Text(quote.songTitle)
                .font(.footnote)
                .foregroundColor(Color("lightColor"))
        }
    }
}

struct FeaturedFooterView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedFooterView(quote: Quote.testQuote)
    }
}
