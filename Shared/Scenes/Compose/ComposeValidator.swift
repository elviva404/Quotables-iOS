//
//  ComposeValidator.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 24/07/2025.
//

import Foundation
import Combine

@MainActor
final class ComposeValidator: ObservableObject {

    @Published var isValid: Bool = false
    @Published var error: Bool = false
    @Published var fieldError: String? = nil
    
    private var isQuoteValid = false
    private var isArtistValid = false
    private var isGenreValid = false


    var composeViewModel: ComposeViewModel!
    var cancellables: Set<AnyCancellable> = []

    init(composeViewModel: ComposeViewModel) {
        self.composeViewModel = composeViewModel
        self.observeValidity()
    }

    private func checkForValidity()  {
        isValid = isQuoteValid && isArtistValid && isGenreValid
    }

    private func observeValidity() {
        composeViewModel.$quoteText.sink { [weak self] text in
            self?.isQuoteValid = self?.performValidation(value: [text], fieldName: "Quote") ?? false
            self?.checkForValidity()
        }.store(in: &cancellables)

        composeViewModel.$artist.sink { [weak self] text in
            self?.isArtistValid = self?.performValidation(value: [text?.name], fieldName: "Artist") ?? false
            self?.checkForValidity()
        }.store(in: &cancellables)

        composeViewModel.$mood.sink { [weak self] moods in
            self?.isGenreValid = self?.performValidation(
                value: Array(moods),
                fieldName: "Moods"
            ) ?? false
            self?.checkForValidity()
        }.store(in: &cancellables)
    }

    private func performValidation(value: [String?]?, fieldName: String) -> Bool {
        guard let valueItem = value?.first, let value1st = valueItem, !value1st.isEmpty else {
            fieldError = "\(fieldName) is required"
            return false
        }

        fieldError = nil
        print("$quoteText ", composeViewModel.quoteText)
        print("$$artist ", composeViewModel.artist)
        print("$mood ", composeViewModel.mood)
        return true
    }
    
}
