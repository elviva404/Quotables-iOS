//
//  ComposeView.swift
//  ComposeView
//
//  Created by Elikem-OZE on 06/11/2021.
//

import SwiftUI

struct ComposeView: View {
    
    @State var quote: String = "Quote.."
    @State var artist: String = "Artist.."
    @State var song: String = "Song .."
    
    var body: some View {
        
        VStack {
            HeaderView(title: "Add Quote")
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            VStack(alignment: .leading) {
                Group {
                    InputTextView(
                        title: "Enter Quote",
                        textfieldText: quote
                    ).frame(height: 120)
                        .background(Color.red)
                    InputTextView(
                        title: "Who said this",
                        textfieldText: artist
                    )
                    InputTextView(
                        title: "On Which song",
                        textfieldText: song
                    )
                }
                .padding(.horizontal, 16)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .font(.headline)
            }
            Spacer()
            Spacer()
            Spacer()
        }
        
        
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView(
            quote: "Enter Quote",
            artist: "Who said this",
            song: "On Which song"
        )
    }
}
