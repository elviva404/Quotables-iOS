//
//  HomeClient.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 11/08/2023.
//

import Foundation
import Combine


protocol QuoteClientProtocol {
    func fetchQuotes(page: Int, size: Int) async throws -> AnyPublisher<PagedResponse<Quote>, Error>
    func likeQuote(id: Int) async throws -> AnyPublisher<DefaultResponse<Quote>, Error>
    func createQuote(quote: Quote) async throws -> AnyPublisher<DefaultResponse<Quote>, Error>
    func shareQuote(id: Int) async throws -> AnyPublisher<DefaultResponse<Quote>, Error>
    func peformSpotifySearch(query: String, type: Int) async throws -> AnyPublisher<DefaultResponse<[SpotifyArtist]>, Error>
}

class QuoteClient: NetworkUtil, QuoteClientProtocol {

    func fetchQuotes(page: Int, size: Int) async throws -> AnyPublisher<PagedResponse<Quote>, Error> {
        let url = baseUrl.appendingPathComponent("quotes", isDirectory: false)

        return self.request(
            url: url,
            method: .get,
            params: ["offset": page, "limit": size],
            expecting: PagedResponse<Quote>.self,
            verbose: true
        )
    }

    func likeQuote(id: Int) async throws -> AnyPublisher<DefaultResponse<Quote>, Error> {
        let url = baseUrl.appendingPathComponent("quotes/\(id)/like", isDirectory: false)

        return self.request(
            url: url,
            method: .post,
            params: nil,
            expecting: DefaultResponse<Quote>.self,
            verbose: true
        )
    }

    func createQuote(quote: Quote) async throws -> AnyPublisher<DefaultResponse<Quote>, Error> {
        let url = baseUrl.appendingPathComponent("quotes-create", isDirectory: false)

        print("QUOTE DICT // " )
        print(quote.asDict)
        return self.request(
            url: url,
            method: .post,
            params: quote.asDict,
            expecting: DefaultResponse<Quote>.self,
            verbose: true
        )
    }

    func shareQuote(id: Int) async throws -> AnyPublisher<DefaultResponse<Quote>, Error> {
        let url = baseUrl.appendingPathComponent("quotes/\(id)/share", isDirectory: false)

        return self.request(
            url: url,
            method: .post,
            params: nil,
            expecting: DefaultResponse<Quote>.self,
            verbose: true
        )
    }

    func peformSpotifySearch(query: String, type: Int) async throws -> AnyPublisher<DefaultResponse<[SpotifyArtist]>, Error> {
        let url = baseUrl.appendingPathComponent("spotify_search", isDirectory: false)

        return self.request(
            url: url,
            method: .get,
            params: [
                "query": query,
                "type": type
            ],
            expecting: DefaultResponse<[SpotifyArtist]>.self,
            verbose: true
        )
    }
}
