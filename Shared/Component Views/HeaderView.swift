//
//  HeaderView.swift
//  Quotables (iOS)
//
//  Created by Elikem-OZE on 14/11/2021.
//

import SwiftUI

struct HeaderView: View {
    
    @State var title: String = ""
    
    var body: some View {
        Text(title)
            .foregroundColor(.black)
            .font(.largeTitle)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)

    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Add Quote")
    }
}
