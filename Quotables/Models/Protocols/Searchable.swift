//
//  Searchable.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 04/02/2024.
//

import Foundation

protocol Searchable: Identifiable {
    var id: String? { get  }
    var name: String { get }
    var url: String? { get }
}
