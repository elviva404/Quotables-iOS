//
//  ShareHeaderView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 17/09/2023.
//

import SwiftUI

struct ShareHeaderView: View {

    var quote: Quote!

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(quote.artist?.name ?? "")
                Text(quote.songTitle ?? "")
            }
            Spacer()
            if quote.verified ?? false {
                Image("verifiedIcon")
            }
        }
    }
}

struct ShareHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShareHeaderView(quote: Quote.testQuote)
    }
}
