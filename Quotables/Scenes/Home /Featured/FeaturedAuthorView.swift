//
//  FearturedAuthorView.swift
//  Quotables (iOS)
//
//  Created by diayan siat on 12/02/2022.
//

import SwiftUI

struct FeaturedAuthorView: View {

    var quote: Quote!

    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .frame(width: 24, height: 24, alignment: .center)
                .background(Color.orange.opacity(0.5))
                .clipShape(Circle())
            Text(quote.contributor?.name ?? "")
            Spacer()
        }
        .padding(.top, 8)
//        .padding(.leading, 16)
    }
}

struct FeaturedAuthorView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedAuthorView(quote: Quote.testQuote)
    }
}
