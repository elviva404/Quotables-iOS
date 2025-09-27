//
//  ButtonFooterView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 19/05/2022.
//

import SwiftUI

struct ButtonFooterView: View {
    
    var config: ButtonView.Configuration!

    var body: some View {
        HStack {
            ButtonView(
                config: ButtonView.Configuration(
                    title: config.title,
                    textColor: config.textColor,
                    backgroundColor: config.backgroundColor
                )
            )

            Button {
                print("Button was tapped")
            } label: {
                Image(config.secondaryIconName ?? "")
                    .padding()
                    .background(config.secondaryBackgroundColor)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(config.secondaryOutlineColor, lineWidth: 1)
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
