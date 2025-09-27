//
//  InputTextView.swift
//  Quotables (iOS)
//
//  Created by Elikem-OZE on 14/11/2021.
//

import SwiftUI

struct InputTextView: View {
    
    @State var title: String = "Title"
    @State var textfieldText: String = "sasdasdasd"

    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            Text(title)
                .font(.title)
            TextView(
                text: $textfieldText,
                textStyle: .headline
            )
        })
    }
}

struct InputTextView_Previews: PreviewProvider {
    static var previews: some View {
        InputTextView()
    }
}
