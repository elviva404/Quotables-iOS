//
//  TestView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 17/05/2022.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Text("Start")
            .foregroundColor(.white)
            .padding(10)
            .background(
                GeometryReader { proxy in
                    Circle()
                        .fill(Color.blue)
                        .frame(width: proxy.size.width,
                               height: proxy.size.width)
                })
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
