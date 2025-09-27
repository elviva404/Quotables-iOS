//
//  DropdownView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 13/02/2022.
//

import SwiftUI

struct DropdownView: View {
    
    @State var value = ""
    @State var isPresented = false

    var title: String
    var placeholder: String
    var usage: SpotifyArtist.MediaType = .artist

    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            HStack {
                Text(title)
                Spacer()
            }
            HStack {
                Text(value.isEmpty ? placeholder : value)
                    .foregroundColor(value.isEmpty ? .gray : .black)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(Color.gray)
                    .font(Font.system(size: 20, weight: .bold))
            }.onTapGesture {
                isPresented = !isPresented
            }.sheet(isPresented: $isPresented) {
                SearchModalListView(usage: usage, title: title, searchplaceholder: placeholder)
            }
            Spacer()
        }
        .frame(height: 60)
    }
}

struct DropdownView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownView(title: "Who said it?", placeholder: "Select artist")
    }
}
