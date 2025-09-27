//
//  GenreCellView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 19/05/2022.
//

import SwiftUI

struct GenreCellView: View {
    
    var body: some View {
        HStack {
            Image("categoryItemImage")
                .resizable()
                .frame(width: 80, height: 50, alignment: .center)
            Text("Hip-Hop")
        }.padding()
    }
}

struct GenreCellView_Previews: PreviewProvider {
    static var previews: some View {
        GenreCellView()
    }
}
