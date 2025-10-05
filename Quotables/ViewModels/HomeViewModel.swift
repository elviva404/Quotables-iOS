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
    @Published var moods = [Mood]()

    var quoteClient: QuoteClientProtocol
    var anyCancellable = Set<AnyCancellable>()
    
    private var fetchInProgress = false
    private var hasNext: URL?
    private var offset = 0
    
    private var oldMoodId: Int?
    private var hasChangedMood: Bool = false

    private var currentTask: Task<Void, Never>?


    init(client: QuoteClientProtocol = QuoteClient()) {
        self.quoteClient = client
    }

    func isLast(quote: Quote) -> Bool {
        guard let id = quotes.last?.id else { return false }
        return quote.id == id
    }

    func fetchQuotes(
        byMood: Mood? = nil,
        shouldRefresh: Bool = false,
        shouldFetchMore: Bool = true
    ) {
        guard !fetchInProgress else {
            print("🚫 Fetch already in progress, ignoring call")
            return
        }
                
        fetchInProgress = true
        hasChangedMood = oldMoodId != byMood?.id

        if shouldFetchMore && !hasChangedMood && hasNext == nil {
            fetchInProgress = false
            return
        }

        if hasChangedMood || hasNext == nil {
            offset = 0
        } else if shouldFetchMore && hasNext != nil {
            if let offset = hasNext?.valueOf("offset"), let offsetInt = Int(offset) {
                self.offset = offsetInt
            }
        }

        Task {
            do {
                let quotes = try await quoteClient.fetchQuotes(byMood: byMood, page: offset, size: 20)
                quotes.sink { error in
                    print("❌ error", error)
                    DispatchQueue.main.async {
                        self.fetchInProgress = false
                    }
                } receiveValue: { response in
                    print("✅ Received response - count: \(response.results?.count ?? 0), hasNext: \(response.next?.absoluteString ?? "nil")")
                    let newQuotes = response.results ?? []
                    self.hasNext = response.next
                    
                    DispatchQueue.main.async {
                        self.fetchInProgress = false
                        self.oldMoodId = byMood?.id
                        
                        if self.hasChangedMood {
                            self.quotes = newQuotes
                        } else {
                            if shouldRefresh {
                                self.quotes.insert(contentsOf: newQuotes, at: 0)
                            } else {
                                self.quotes.append(contentsOf: newQuotes)
                            }
                        }
                    }
                }.store(in: &anyCancellable)
            } catch {
                print("❌ Task error", error)
                DispatchQueue.main.async {
                    self.fetchInProgress = false
                }
            }
        }
    }

    func fetchMoods(onComplete: @escaping () -> Void) {
        Task {
            let moods = try await quoteClient.fetchMoods(page: 0, size: 50)
            moods.sink { error in
                print("❌ mood fetch error", error)
            } receiveValue: { response in

                let moods = response

                DispatchQueue.main.async {
                    self.moods.append(contentsOf: moods)
                    onComplete()
                }
            }.store(in: &anyCancellable)

        }
    }

}
