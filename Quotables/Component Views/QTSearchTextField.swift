//
//  QTSearchTextField.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 20/05/2025.
//

import SwiftUI

struct QTSearchTextField: View {
    @Binding var searchText: String
    
    var titleLabel: String
    var placeholder: String
    var suggestions = [any Searchable]()
    var onSearch: (String) -> Void
    var onSuggestionSelected: (any Searchable) -> Void
    
    @State private var isEditing = false
    @State private var showSuggestions = false
    
    var filteredSuggestions: [any Searchable] {
        if searchText.isEmpty {
            return []
        }
        return suggestions.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(titleLabel)
                .font(.headline)
//                .padding(.horizontal)

            HStack {
                TextField(placeholder, text: $searchText)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 8)
                    .onChange(of: searchText) { newValue in
                        showSuggestions = !newValue.isEmpty
                        onSearch(newValue)
                    }
                    .onTapGesture {
                        isEditing = true
                        showSuggestions = !searchText.isEmpty
                    }
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                        showSuggestions = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                    }
                }
                Spacer()
            }
            .background(Color(.white))
            .cornerRadius(10)
//            .padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isEditing ? Color.blue : Color.clear, lineWidth: 1)
            )
            
            if showSuggestions && !filteredSuggestions.isEmpty {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(filteredSuggestions, id: \.id) { suggestion in
                            Button(action: {
                                searchText = suggestion.name
                                showSuggestions = false
                                onSuggestionSelected(suggestion)
                            }) {
                                HStack {
                                    Text(suggestion.name)
                                        .foregroundColor(.primary)
                                    Spacer()
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                            }
                            .background(Color(.systemBackground))
                            
                            if suggestion.name != filteredSuggestions.last?.name {
                                Divider()
                                    .padding(.leading, 16)
                            }
                        }
                    }
                }
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding(.horizontal)
                .frame(maxHeight: 200)
            }
        }
    }
}

//#Preview {
//    QTSearchTextField(
//        searchText: .constant(""),
//        titleLabel: "Random Title",
//        placeholder: "Search quotes...",
//        suggestions: ["Drake - Started From the Bottom", "Drake - God's Plan", "Drake - Hotline Bling"],
//        onSearch: { _ in },
//        onSuggestionSelected: { _ in }
//    )
//}
