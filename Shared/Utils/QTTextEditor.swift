//
//  QTTextEditor.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 11/11/2023.
//

import SwiftUI

struct QTTextEditor: View {

    var title: String = ""
    let placeholder: String
    @Binding var text: String

     init(title: String = "", placeholder: String, text: Binding<String>) {
         self.placeholder = placeholder
         self._text = text
         self.title = title
         UITextView.appearance().backgroundColor = .clear
     }

     var body: some View {
         VStack {
             if !title.isEmpty {
                 HStack {
                     Text(title)
                         .font(.headline)
                     Spacer()
                 }
             }
             ZStack(alignment: .topLeading) {
                 TextEditor(text: $text)
                     .multilineTextAlignment(.leading)
                     .foregroundColor(.black)
                     .tint(.black)
                 
                 if text.isEmpty {
                     Text(placeholder)
                         .foregroundColor(Color(.placeholderText))
                         .padding(.horizontal, 5)
                         .padding(.vertical, 8)
                 }
             }
             .font(.body)
         }
     }
}

struct QTTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        @State var title: String = ""
        QTTextEditor(title: "hey", placeholder: "What is the title", text: $title)
    }
    
}
