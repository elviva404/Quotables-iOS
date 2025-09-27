//
//  MoodHeaderView.swift
//  Quotables
//
//  Created by Elikem Savie on 2/6/22.
//

import SwiftUI

struct MoodHeaderView: View {

    var featuredColumns: [GridItem] {
        [
            GridItem(.fixed(200)),
        ]
    }
    
    var moods = ["String", "Cons", "Leage", "asd", "Warter gate"]

    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: featuredColumns,
                alignment: .center,
                spacing: 8
            ) {
                
                Section {
                    ForEach(moods, id: \.self) { mood in
                        Text(mood)
                            .frame(minHeight: 16)
                            .padding(8)
                            .foregroundColor(Color.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                }
            }
        }.frame(height: 40, alignment: .center)
    }

}

struct MoodHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MoodHeaderView()
    }
}

