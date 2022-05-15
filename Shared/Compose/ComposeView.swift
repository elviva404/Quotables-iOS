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
        
        NavigationView {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Group {
                            Text("Add Quote")
                            InputTextView(
                                title: "",
                                textfieldText: quote
                            )
                                .frame(height: 200)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            DropdownView()
                            DropdownView()
                        }
                        .padding(.horizontal, 16)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .font(.headline)
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    ButtonView(
                        config: ButtonView.Configuration(
                            title: "Submit",
                            textColor: .white,
                            backgroundColor: .red
                        )
                    )
                }
            }
            .navigationBarTitle(Text("Add Quote"))
        }
        
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView(
            quote: "Enter that awesome Quote here.......\n(max of 100 characters)",
            artist: "Who said this",
            song: "On Which song"
        )
    }
}
