//
//  HomeViewModelTests.swift
//  QuotablesTests
//
//  Created by Elikem Savie on 27/09/2025.
//

import XCTest
@testable import Quotables
import Combine

final class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!
    var mockClient: MockQuoteClient!
    
    override func setUpWithError() throws {
        mockClient = MockQuoteClient()
        sut = HomeViewModel(client: mockClient)
    }

    func test_fetchQuotes() {
        let exp = expectation(description: "fetching quotes")
        let cancellable = sut.$quotes
            .dropFirst()
            .sink { quotes in
                XCTAssertEqual(quotes.count, 2)
                exp.fulfill()
            }
        
        sut.fetchQuotes(shouldFetchMore: false)
        
        wait(for: [exp], timeout: 3)
        cancellable.cancel()
    }

    func test_fetchQuotesMore_success() {
        var emmissionCount = 0
        mockClient.receivedPages = []
        let exp = expectation(description: "pagination appends until no next")
        exp.expectedFulfillmentCount = 2
        
        
        let cancellable = sut.$quotes
            .dropFirst()
            .sink { quotes in
                emmissionCount += 1
                
                if emmissionCount == 1 {
                    XCTAssertEqual(quotes.count, 2)
                    self.sut.fetchQuotes(shouldFetchMore: true)
                    exp.fulfill()
                } else if emmissionCount == 2 {
                    XCTAssertEqual(quotes.count, 4)
                    exp.fulfill()
                }
            }

        sut.fetchQuotes(shouldFetchMore: false)

        wait(for: [exp], timeout: 3)
        cancellable.cancel()
        
        XCTAssertEqual(mockClient.receivedPages, [0, 20])

        let callsBefore = mockClient.receivedPages.count
        sut.fetchQuotes(shouldFetchMore: true)
        XCTAssertEqual(mockClient.receivedPages.count, callsBefore)
    }


}


class MockQuoteClient: QuoteClientProtocol {
    
    var paginationFetchCount = 0
    var receivedPages: [Int] = []

    func fetchQuotes(byMood: Mood?, page: Int, size: Int) async throws -> AnyPublisher<PagedResponse<Quotables.Quote>, any Error> {
        
        paginationFetchCount += 1
        receivedPages.append(page)
        
        let quotes = [
            Quote.testQuote,
            Quote.testQuote2,
        ]
        
        var paged = PagedResponse<Quote>()
        paged.results = quotes
        paged.count = quotes.count
        paged.previous = nil

        if page == 0 {
            paged.next = URL(string: "http://127.0.0.1:8000/api/quotes?offset=20&limit=20")
        } else if page == 20 {
            paged.next = nil
        } else {
            paged.next = nil
        }

        return Just(paged)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func fetchMoods(page: Int, size: Int) async throws -> AnyPublisher<[Mood], any Error> {
        return Just(Mood.testMoods)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func likeQuote(id: Int) async throws -> AnyPublisher<DefaultResponse<Quotables.Quote>, any Error> {
        let def = DefaultResponse<Quotables.Quote>()
        def.data = Quotables.Quote.testQuote
        return Just(def)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
            
    }
    
    func createQuote(quote: Quotables.Quote) async throws -> AnyPublisher<Quotables.DefaultResponse<Quotables.Quote>, any Error> {
        let def = DefaultResponse<Quotables.Quote>()
        def.data = Quotables.Quote.testQuote
        return Just(def)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func shareQuote(id: Int) async throws -> AnyPublisher<Quotables.DefaultResponse<Quotables.Quote>, any Error> {
        let def = DefaultResponse<Quotables.Quote>()
        def.data = Quotables.Quote.testQuote
        return Just(def)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func peformSpotifySearch(query: String, type: Int) async throws -> AnyPublisher<Quotables.DefaultResponse<[SpotifyArtist]>, any Error> {
        let artist = SpotifyArtist()
        let def = DefaultResponse<[SpotifyArtist]>()
        def.data = [artist]
        return Just(def)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    
}
//
//static var testQuote: Quote {
//    return Quote(
////            id: -1,
//        quote: "I'm always on the rise like stew",
//        songTitle: "Sugar",
//        artist: Artist(id: -2, name: "Drake", category: -1, profileImageURL: nil),
//        contributor: Contributor(id: -1, email: "elviva", name: "Elikem"),
//        isFeatured: true
//    )
//}
//
//static var testQuote2: Quote {
//    return Quote(
////            id: -1,
//        quote: "I am great man",
//        songTitle: "Weeknd",
//        artist: Artist(id: -2, name: "Weeknd", category: -1, profileImageURL: nil),
//        contributor: Contributor(id: -1, email: "elviva", name: "Elikem"),
//        isFeatured: true
//    )
//}
