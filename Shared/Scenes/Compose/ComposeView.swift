//
//  ComposeView.swift
//  ComposeView
//
//  Created by Elikem-OZE on 06/11/2021.
//

import SwiftUI

struct ComposeView: View {
    @StateObject private var viewModel = ComposeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        VStack(alignment: .leading) {
                            Divider()
                            Spacer()
                            Group {
                                Spacer()
                                QTTextEditor(title: "Enter your quote", placeholder: "Enter that awesome Quote here",text: $viewModel.quoteText)
                                    .frame(minHeight: 60, maxHeight: 200)
                                    .padding(.vertical, 8)
                                Spacer()
                                Divider()

                                QTSearchTextField(
                                    searchText: $viewModel.artistSearchText,
                                    titleLabel: "Who said it?",
                                    placeholder: "Search artist...",
                                    suggestions: viewModel.artistSuggestions,
                                    onSearch: { query in
//                                        viewModel.performSearch(query: query, for: .artist)
                                    },
                                    onSuggestionSelected: { suggestion in
                                        viewModel.handleSuggestionSelected(suggestion, for: .artist)
                                    }
                                )
                                Divider()
                                QTSearchTextField(
                                    searchText: $viewModel.songSearchText,
                                    titleLabel: "What is the title",
                                    placeholder: "Search quotes...",
                                    suggestions: viewModel.songSuggestions,
                                    onSearch: { query in
                                        viewModel.performSearch(query: query, for: .artist)
                                    },
                                    onSuggestionSelected: { suggestion in
                                        viewModel.handleSuggestionSelected(suggestion, for: .song)
                                    }
                                )
//                                Divider()

//                                QTSearchTextField(
//                                    searchText: $viewModel.genreSearchText,
//                                    titleLabel: "What's the songs genre",
//                                    placeholder: "Search Genre...",
//                                    suggestions: viewModel.genreSuggestions,
//                                    onSearch: { query in
//                                        viewModel.performSearch(query: query, for: .genre)
//                                    },
//                                    onSuggestionSelected: { suggestion in
//                                        viewModel.handleSuggestionSelected(suggestion, for: .genre)
//                                    }
//                                )

                                Divider()
                                CategoryPickerView(
                                    titleLabel: "How does it make you feel",
                                    categories: ["Estatic", "i'm that guy", "Hustle", "Killer Ntua", "Missing Bae"],
                                    selectedCategories: ["Killer Ntua"]
                                )
                            }
                            .padding(.horizontal, 16)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .font(.headline)
                        }
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
                ButtonView(
                    config: ButtonView.Configuration(
                        title: "Submit",
                        textColor: .white,
                        backgroundColor: viewModel.isFormValid ? .red : .gray
                    )
                )
                .onTapGesture {
                    viewModel.submitQuote()
                }
                .disabled(!viewModel.isFormValid)
            }
            .navigationBarTitle(Text("Add Quote"))
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
    }
}
