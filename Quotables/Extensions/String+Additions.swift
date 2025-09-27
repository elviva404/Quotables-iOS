//
//  String+Additions.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 12/11/2023.
//

import Foundation

extension String {
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}
