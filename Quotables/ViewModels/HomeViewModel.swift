//
//  HomeViewModel.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 2/1/22.
//

import Foundation
import Combine
import UIKit
import SwiftUI

enum HomeSection: String {
    case featured
    case normal = "Quotes"
}

struct FeedItem: Identifiable {
    var section: HomeSection
    var quotes: [Quote]
    var id: String { section.rawValue }
}

final class HomeViewModel: ObservableObject {


    @Published private(set) var feedpub = [FeedItem]()
    
    @Published var quotes = [Quote]()
    
    var quoteClient: QuoteClientProtocol
    var anyCancellable = Set<AnyCancellable>()
    
    private var fetchInProgress = false
    
    private var hasNext: URL?
    private var offset = 0

    init(client: QuoteClientProtocol = QuoteClient()) {
        self.quoteClient = client
    }

    func isLast(quote: Quote) -> Bool {
        guard let id = quotes.last?.id else { return false }
        return quote.id == id
    }

    func fetchQuotes(
        shouldRefresh: Bool = false,
        shouldFetchMore: Bool = true
    ) {
        guard !fetchInProgress else { return }
        
        fetchInProgress = true

        if let url = hasNext, let offset = url.valueOf("offset"), let offsetInt = Int(offset) {
            self.offset = offsetInt
        }

        Task {
            let quotes = try await quoteClient.fetchQuotes(page: offset, size: 20)
            quotes.sink { error in
                print("❌ error", error)
                self.fetchInProgress = false
            } receiveValue: { response in
                self.fetchInProgress = false

                let newQuotes = response.results ?? []
                self.hasNext = response.next

                DispatchQueue.main.async {
                    if shouldRefresh {
                        self.quotes.insert(contentsOf: newQuotes, at: 0)
                    } else {
                        self.quotes.append(contentsOf: newQuotes)
                    }
                }
        

            }.store(in: &anyCancellable)

        }
        
    }

}
