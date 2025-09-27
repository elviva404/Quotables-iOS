//
//  FontEnum.swift
//  Quotables
//
//  Created by Elikem Savie on 22/05/2022.
//

import Foundation
import SwiftUI

enum SFPro: String {
    case italicRegular = "SFPRODISPLAYBLACKITALIC"
    case italicLight = "SFPRODISPLAYLIGHTITALIC"
    case italicThin = "SFPRODISPLAYTHINITALIC"
    case italicHeavy = "SFPRODISPLAYHEAVYITALIC"
    case italicSemiBold = "SFPRODISPLAYSEMIBOLDITALIC"
    case italicUltraLight = "SFPRODISPLAYULTRALIGHTITALIC"
    case boldItalic = "DMSans-BoldItalic"

    case regular = "SFPRODISPLAYREGULAR"
    case medium = "SFPRODISPLAYMEDIUM"
    case bold = "SFPRODISPLAYBOLD"

    static func font(from weight: UIFont.Weight) -> SFPro {
        switch weight {
        case .regular:
            return .regular
        case .medium:
            return .medium
        case .bold:
            return .bold
        default:
            return .regular
        }
    }

}
 
