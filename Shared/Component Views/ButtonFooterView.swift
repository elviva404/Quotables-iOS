//
//  ButtonFooterView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 19/05/2022.
//

import SwiftUI

struct ButtonFooterView: View {
    var body: some View {
        HStack {
            ButtonView(
                config: ButtonView.Configuration(
                    title: "Butt",
                    textColor: .blue,
                    backgroundColor: .green
                )
            )

            Button {
                print("Button was tapped")
            } label: {
                Image("shuffleIcon")
                    .padding()
                    .background(.gray)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
            .frame(width: 60, height: 60, alignment: .center)
            Spacer()
        }
        .background(.clear)
    }
}

struct ButtonFooterView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonFooterView()
    }
}
