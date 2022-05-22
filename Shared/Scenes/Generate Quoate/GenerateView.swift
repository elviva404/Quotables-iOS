//
//  GenerateView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 19/05/2022.
//

import SwiftUI

struct GenerateView: View {
    
    enum CategoryType {
        case mood
        case artist
        case genre
    }

    struct SectionItem: Identifiable {
        let id = UUID()
        var type: CategoryType = .mood
    }

    var lists: [SectionItem] {
        return [
            SectionItem(type: .mood),
            SectionItem(type: .artist),
            SectionItem(type: .genre),
        ]
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(lists) { item in
                        switch item.type {
                        case .mood:
                            GenerateMoodView()
                                .frame(height: 120, alignment: .center)
                        case .genre:
                            DropdownView().frame(height: 120, alignment: .center)
                        case .artist:
                            DropdownView()
                                .frame(height: 120, alignment: .center)
                        }
                    }
                }
                ButtonFooterView()
            }
            .navigationBarTitle(Text("Get a quote"))
        }
    }

    struct FooterView: View {
        var body: some View {
            Text("Footer Note")
                .foregroundColor(.yellow)
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(Color.red)
        }
    }

}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView()
    }
}
