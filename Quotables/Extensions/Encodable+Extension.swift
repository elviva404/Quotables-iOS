//
//  Encodable+Extension.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 28/08/2025.
//

import Foundation

extension Encodable {
    func toDictionnary() -> [String: Any]? {
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self), options: .fragmentsAllowed)) as? [String: Any]
    }
}
