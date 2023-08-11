//
//  NetworkUtil.swift
//  Quotables
//
//  Created by Elikem Savie on 24/09/2022.
//

import Foundation
import Combine

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case trace = "TRACE"
    case connect = "CONNECT"
}

protocol NetworkUtil {
    var baseUrl: URL { get }
    var headers: [String: String] { get }
}

extension NetworkUtil {
    var baseUrl: URL {
        return URL(string: "http://127.0.0.1:8000/api")!
    }

    func request<T: Codable>(
        url: URL,
        method: HTTPMethod,
        params: [String: Any]?,
        expecting responseType: T.Type,
        verbose: Bool = false
    ) -> AnyPublisher<T, Error>  {
        var request: URLRequest
        if method == .get {
            var components = URLComponents(string: url.absoluteString)!
            components.queryItems = params?.map { arg -> URLQueryItem in
                let (key, value) = arg
                return URLQueryItem(name: key, value: "\(value)")
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(
                of: "+", with: "%2B"
            )
            request = URLRequest(url: components.url!)
        } else {
            request = URLRequest(url: url)
            if let params = params {
                let jsonData = try? JSONSerialization.data(
                    withJSONObject: params,
                    options: .prettyPrinted
                )
                request.httpBody = jsonData
            }
        }
        
        request.httpMethod = method.rawValue
        return fetchURsL(urlReq: request, method: method, params: params, expecting: responseType)
    }

    private func fetchURsL<T: Decodable>(
        urlReq: URLRequest,
        method: HTTPMethod,
        params: [String: Any]?,
        expecting responseType: T.Type,
        verbose: Bool = false
    ) -> AnyPublisher<T, Error> {
        
        URLSession.shared.dataTaskPublisher(for: urlReq)
            .mapError({ $0 as Error })
            .flatMap({ result -> AnyPublisher<T, Error> in
                guard let urlResponse = result.response as? HTTPURLResponse, (200...299).contains(urlResponse.statusCode) else {
                    return Just(result.data)
                        .decode(type: APIError.self, decoder: JSONDecoder())
                        .tryMap({ errorModel in
                            throw errorModel
                        })
                        .eraseToAnyPublisher()
                }

                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

                return Just(result.data).decode(type: T.self, decoder: decoder).eraseToAnyPublisher()
            }).eraseToAnyPublisher()
    }

    
    func jsonSerializeOrError(_ data: Data) throws -> [String: Any] {
        guard let json = try JSONSerialization.jsonObject(
            with: data, options: []
        ) as? [String: Any] else { throw NetworkError.unknownError }

        return json
    }

    func decode<T: Codable>(_ data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

        return try decoder.decode(T.self, from: data)
    }
}
