//
//  SwitchView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 05/06/2022.
//

import SwiftUI

struct SwitchView: View {
    
    let theme = ThemeManager.current

    var body: some View {
        VStack {
            Text("Pick a Swatch")
            
            HStack{
                CircleView(color: theme.lightPrimaryColor)
                Spacer()
                CircleView(color: .white)
                Spacer()
                CircleView(color: .black)
            }
            .padding(.horizontal, 64)

        }
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView()
    }
}
