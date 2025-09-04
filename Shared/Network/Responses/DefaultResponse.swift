//
//  DefaultResponse.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 03/09/2025.
//

import Foundation

enum ResponseStatus: String, Codable {
    case success = "success"
    case failure = "error"
}

final public class DefaultResponse<T: Codable>: Codable {

    var message: String?
    var data: T?
    var status: ResponseStatus?
    var statusCode: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case status
        case statusCode = "status_code"
    }
}

final public class ErrorResponse: Codable, Error {
    
    var message: String?
    var errors: [String: [String]]?
    var status: ResponseStatus?
    var statusCode: Int?
    
    private var flattenedErrors: [String: String] {
        guard let errors = errors else { return [:] }
        return errors.reduce(into: [String: String]()) { result, entry in
            if let firstMessage = entry.value.first {
                result[entry.key] = firstMessage
            }
        }
    }

    var combinedErrorMessage: String {
        flattenedErrors.map { "\($0.key): \($0.value)" }
            .joined(separator: "\n")
    }
    
    enum CodingKeys: String, CodingKey {
        case message
        case status
        case statusCode = "status_code"
        case errors
    }
}
