//
//  CategoryItemView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 15/05/2022.
//

import SwiftUI

struct CategoryItemView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image("categoryItemImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Qater")
                    .position(x: 20, y: proxy.size.height - 30)
                    .foregroundColor(.white)
                
            }
            .padding(10.0)
            .cornerRadius(8)
            .background(
              LinearGradient(
                gradient: Gradient(
                  colors: [
                    Color.black,
                    Color(red: 0.0, green: 0, blue: 0, opacity: 0.09)
                  ]
                ),
                startPoint: .bottom,
                endPoint: .top
              )
            )
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView()
    }
}
