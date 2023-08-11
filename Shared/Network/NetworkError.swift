//
//  NetworkError.swift
//  Quotables
//
//  Created by Elikem Savie on 25/09/2022.
//

import Foundation

enum NetworkError: Error {
    case missingAccessToken
    case missingParam
    case missingProfile
    case missingStatusCode
    case noDataReturned
    case redirectError
    case clientError(additionalInfo: [String: Any]?)
    case serverError(additionalInfo: [String: Any]?)
    case methodNotSupported
    case noResponse
    case noErrorPayload
    case noMissingStatusCode
    case invalidResponseType
    case missingUrl
    case notImplemented
    case unknownError

    var reason: String {
        switch self {
        case .missingAccessToken:
            return "An error occurred while accessing stored access token"
        case .missingParam:
            return "An error occurred while accessing parameters"
        case .missingUrl:
            return "An error occurred while unwrapping URL"
        case .missingProfile:
            return "An error occurred while accessing profile"
        case .missingStatusCode:
            return "An error occurred while accessing status code"
        case .noErrorPayload:
            return ""
        case .noResponse:
            return "No response returned from server"
        case .noDataReturned:
            return "An error occurred while fetching data"
        case .invalidResponseType:
            return "Expected response type that conforms to the Response protocol"
        case .noMissingStatusCode:
            return "Expected response to have status code"
        case .notImplemented:
            return "Not implemented"
        case .unknownError:
            return "An unknown error occurred while fetching data"
        case .redirectError:
            return "Redirect errors occurred while processing request"
        case .clientError:
            return "A client error occurred while processing request"
        case .serverError:
            return "Server errors occurred while processing request"
        case .methodNotSupported:
            return "Request Method not supported"
        }
    }
}

struct APIError: Decodable, Error {
  // fields that model your error
    var statusCode = 0
}
