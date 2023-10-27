//
//  HomeClient.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 11/08/2023.
//

import Foundation
import Combine

class QuoteClient: NetworkUtil {

    func fetchQuotes() async throws -> AnyPublisher<[Quote], Error> {
        let url = baseUrl.appendingPathComponent("quotes", isDirectory: false)

        return self.request(
            url: url,
            method: .get,
            params: nil,
            expecting: [Quote].self,
            verbose: true
        )
    }

    func likeQuote(id: Int) async throws -> AnyPublisher<Quote, Error> {
        let url = baseUrl.appendingPathComponent("quotes/\(id)/like", isDirectory: false)

        return self.request(
            url: url,
            method: .post,
            params: nil,
            expecting: Quote.self,
            verbose: true
        )
    }

    func shareQuote(id: Int) async throws -> AnyPublisher<Quote, Error> {
        let url = baseUrl.appendingPathComponent("quotes/\(id)/share", isDirectory: false)

        return self.request(
            url: url,
            method: .post,
            params: nil,
            expecting: Quote.self,
            verbose: true
        )
    }
}
