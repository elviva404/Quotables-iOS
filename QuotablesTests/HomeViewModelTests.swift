//
//  HomeViewModelTests.swift
//  Tests iOS
//
//  Created by Elikem Savie on 27/09/2025.
//

import XCTest
@testable import Quotables
import Combine

final class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = HomeViewModel(client: MockQuoteClient())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_fetchQuotes() {
        let exp = expectation(description: "fetching quotes")
        
        sut.fetchQuotes()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            exp.fulfill()
        }

        XCTAssertEqual(self.sut.quotes.count, 2)
        wait(for: [exp], timeout: 1.0)
    }


}


class MockQuoteClient: QuoteClientProtocol {

    func fetchQuotes(page: Int, size: Int) async throws -> AnyPublisher<PagedResponse<Quote>, any Error> {
        
        let quotes = [
            Quote.testQuote,
            Quote.testQuote2,
        ]
        
        var paged = PagedResponse<Quotables.Quote>()
        paged.results = quotes
        paged.count = quotes.count
        paged.previous = nil
        paged.next = nil
        
        return Just(paged)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func likeQuote(id: Int) async throws -> AnyPublisher<Quotables.DefaultResponse<Quotables.Quote>, any Error> {
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

static var testQuote: Quote {
    return Quote(
//            id: -1,
        quote: "I'm always on the rise like stew",
        songTitle: "Sugar",
        artist: Artist(id: -2, name: "Drake", category: -1, profileImageURL: nil),
        contributor: Contributor(id: -1, email: "elviva", name: "Elikem"),
        isFeatured: true
    )
}

static var testQuote2: Quote {
    return Quote(
//            id: -1,
        quote: "I am great man",
        songTitle: "Weeknd",
        artist: Artist(id: -2, name: "Weeknd", category: -1, profileImageURL: nil),
        contributor: Contributor(id: -1, email: "elviva", name: "Elikem"),
        isFeatured: true
    )
}
