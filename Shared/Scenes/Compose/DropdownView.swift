//
//  DropdownView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 13/02/2022.
//

import SwiftUI

struct DropdownView: View {
    
    @State var value = ""
    @State var isPresented = false
    @State var leader = Leaderboard()


    var title = "Who Said It?"
    var placeholder = "Select Client"
    var dropDownList = ["PSO", "PFA", "AIR", "HOT"]
    
    let searches = [
        Artist(name: "Drake"),
        Artist(name: "Kanye"),
        Artist(name: "Kidi")
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            HStack {
                Text(title)
                Spacer()
            }
            HStack {
                Text(value.isEmpty ? placeholder : value)
                    .foregroundColor(value.isEmpty ? .gray : .black)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(Color.gray)
                    .font(Font.system(size: 20, weight: .bold))
            }.onTapGesture {
                isPresented = !isPresented
            }.sheet(isPresented: $isPresented) {
                ModalListView()
            }
            Spacer()
        }
        .frame(height: 60)
    }
}

struct DropdownView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownView()
    }
}
