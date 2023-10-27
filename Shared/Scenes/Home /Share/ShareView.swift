//
//  ShareView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 05/06/2022.
//

import SwiftUI

struct ShareView: View {

    let theme = ThemeManager.current
    var quote: Quote!

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 52) {
                        Spacer()
                        FeaturedView(
                            quote: quote,
                            usage: .share
                        )
                        SwitchView()
                    }
                }
                .padding(.horizontal, 16)
                ZStack {
                    ButtonFooterView(
                        config: ButtonView.Configuration(
                            title: "Share as Image",
                            textColor: .white,
                            backgroundColor: theme.lightPrimaryColor,
                            action: nil,
                            secondaryIconName: "copyIcon",
                            secondaryBackgroundColor: theme.black_05,
                            secondaryOutlineColor: theme.black_20,
                            secondaryAction: nil)
                    )
                }
            }
            .navigationBarTitle(Text("Share Card"))
    }
        
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView(quote: Quote.testQuote)
    }
}
