//
//  ButtonView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 26/03/2022.
//

import SwiftUI

struct ButtonView: View {

    struct Configuration {
        var title: String
        var textColor: Color
        var backgroundColor: Color
        var action: (() -> Void)?
        var secondaryIconName: String? = nil
        var secondaryBackgroundColor: Color? = nil
        var secondaryOutlineColor: Color = .black
        var secondaryAction: (() -> Void)?
    }

    var config: Configuration!
    
    init(config: Configuration) {
        self.config = config
    }

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Text(config.title)
                    .foregroundColor(config.textColor)
                    .padding(.leading, 48)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding()
            }
            Button("", action: {})
                .frame(height: 40, alignment: .center)
                .padding()
        }
        .background(config.backgroundColor)
        .cornerRadius(16)
        .frame(maxWidth: .infinity, minHeight: 40)
        .padding()
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(config: ButtonView.Configuration(
            title: "Submit",
            textColor: .white,
            backgroundColor: .yellow, secondaryBackgroundColor: .red)
        )
    }
}
