//
//  FeaturedView.swift
//  Quotables
//
//  Created by Elikem-OZE on 24/07/2021.
//

import SwiftUI

struct FeaturedView: View {

    var quote: Quote!

    var body: some View {

        VStack(alignment: .leading) {
            Text(quote.quote)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.green)
            Text(quote.artist)
                .font(.subheadline)
                .italic()
                .foregroundColor(.blue)
            Text(quote.song)
                .font(.subheadline)
                .foregroundColor(.blue)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipped()
        .background(Color.yellow)
        .cornerRadius(16)
        .padding(.horizontal, 8)
    }
    
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
