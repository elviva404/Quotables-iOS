//
//  CircleView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 05/06/2022.
//

import SwiftUI

struct CircleView: View {

    let theme = ThemeManager.current
    var color: Color!
    @State var selected = false
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 40, height: 40)
                .overlay(
                    Circle()
                        .stroke(theme.black_20, lineWidth: 1)
                )
            if selected {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.clear)
                    .background(.clear)
                    .overlay(
                        Circle()
                            .stroke(theme.lightPrimaryColor, lineWidth: 2)
                    )
            }
        }
        .frame(width: 50, height: 50)
        .onTapGesture {
            selected = !selected
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red)
    }
}
