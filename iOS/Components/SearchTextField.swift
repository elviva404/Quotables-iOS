import SwiftUI

struct SearchTextField: View {
    @Binding var searchText: String
    var placeholder: String
    var suggestions: [String]
    var onSearch: (String) -> Void
    var onSuggestionSelected: (String) -> Void
    
    @State private var isEditing = false
    @State private var showSuggestions = false
    
    var filteredSuggestions: [String] {
        if searchText.isEmpty {
            return []
        }
        return suggestions.filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                
                TextField(placeholder, text: $searchText)
                    .padding(8)
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
            }
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isEditing ? Color.blue : Color.clear, lineWidth: 1)
            )
            
            // Suggestions List
            if showSuggestions && !filteredSuggestions.isEmpty {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(filteredSuggestions, id: \.self) { suggestion in
                            Button(action: {
                                searchText = suggestion
                                showSuggestions = false
                                onSuggestionSelected(suggestion)
                            }) {
                                HStack {
                                    Text(suggestion)
                                        .foregroundColor(.primary)
                                    Spacer()
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                            }
                            .background(Color(.systemBackground))
                            
                            if suggestion != filteredSuggestions.last {
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

#Preview {
    SearchTextField(
        searchText: .constant(""),
        placeholder: "Search quotes...",
        suggestions: ["Drake - Started From the Bottom", "Drake - God's Plan", "Drake - Hotline Bling"],
        onSearch: { _ in },
        onSuggestionSelected: { _ in }
    )
} 