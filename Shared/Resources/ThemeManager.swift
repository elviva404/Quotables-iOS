//
//  ThemeManager.swift
//  Quotables
//
//  Created by Elikem Savie on 22/05/2022.
//

import Foundation
import SwiftUI

enum Theme: Int {
    case `default`
}

extension Theme {

    var lightPrimaryColor: Color {
        switch self {
        case .default:
            return Color(
                red: 124 / 255.0, green: 1 / 255.0, blue: 237 / 255.0
            )
        }
    }

    var lightSecondaryColor: Color {
        switch self {
        case .default:
            return Color( // #A41F24
                red: 63 / 255.0, green: 0 / 255.0, blue: 185 / 255.0
            )
        }
    }

    var lightAlternativeColor: Color {
        switch self {
        case .default:
            return Color( // #A41F24
                red: 174 / 255.0, green: 174 / 255.0, blue: 178 / 255.0
            )
        }
    }

    var primaryDarkColor: Color {
        switch self {
        case .default:
            return Color( // #A41F24
                red: 128 / 255.0, green: 31 / 255.0, blue: 32 / 255.0
            )
        }
    }

    var secondaryDarkColor: Color {
        switch self {
        case .default:
            return Color(
                red: 255 / 255.0, green: 193 / 255.0, blue: 255 / 255.0
            )
        }
    }

    var systemRedColor: Color {
        switch self {
        case .default:
            return Color( // #0D0D0D
                red: 255 / 255.0, green: 59 / 255.0, blue: 48 / 255.0
            )
        }
    }

    var systemOrangeColor: Color {
        switch self {
        case .default:
            return Color( // #0D0D0D
                red: 255 / 255.0, green: 149 / 255.0, blue: 0 / 255.0
            )
        }
    }

    var systemYellowColor: Color {
        switch self {
        case .default:
            return Color( // #0D0D0D
                red: 255 / 255.0, green: 204 / 255.0, blue: 0 / 255.0
            )
        }
    }

    var systemGreenColor: Color {
        switch self {
        case .default:
            return Color( // #0D0D0D
                red: 52 / 255.0, green: 199 / 255.0, blue: 89 / 255.0
            )
        }
    }

    var systemTealColor: Color {
        switch self {
        case .default:
            return Color( // #0D0D0D
                red: 90 / 255.0, green: 200 / 255.0, blue: 250 / 255.0
            )
        }
    }

    var systemPinkColor: Color {
        switch self {
        case .default:
            return Color( // #0D0D0D
                red: 0 / 255.0, green: 122 / 255.0, blue: 255 / 255.0
            )
        }
    }

    var whiteColor: Color {
        switch self {
        case .default:
            return Color( // #0D0D0D
                red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0
            )
        }
    }

    var lightBackgroundColor: Color {
        switch self {
        case .default:
            return Color( // #707070
                red: 242 / 255.0, green: 242 / 255.0, blue: 247 / 255.0
            )
        }
    }

    var lightBackgroundColor2: Color {
        switch self {
        case .default:
            return Color( // #CECECE
                red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0
            )
        }
    }

    var darkPrimaryColor: Color {
        switch self {
        case .default:
            return Color( // #CECECE
                red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0
            )
        }
    }

    var darkSecondaryColor: Color {
        switch self {
        case .default:
            return Color( // #CECECE
                red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0
            )
        }
    }
    

    var systemSecondaryColor: Color {
        switch self {
        case .default:
            return Color( // #CECECE
                red: 44 / 255.0, green: 44 / 255.0, blue: 46 / 255.0
            )
        }
    }

    var black_05: Color {
        switch self {
        case .default:
            return Color( // #CECECE
                red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, opacity: 0.05
            )
        }
    }

    var black_20: Color {
        switch self {
        case .default:
            return Color( // #CECECE
                red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, opacity: 0.2
            )
        }
    }

}

extension Theme {

    var largeTitleFont: Font? {
        switch self {
        case .default:
            return Font.custom(SFPro.regular.rawValue, size: 34)
        }
    }

    var titleFont: Font {
        switch self {
        case .default:
            return Font.custom(SFPro.bold.rawValue, size: 28)
        }
    }

    var titleFont2: Font {
        switch self {
        case .default:
            return Font.custom(SFPro.regular.rawValue, size: 22)
        }
    }

    var titleFont3: Font? {
        switch self {
        case .default:
            return Font.custom(SFPro.bold.rawValue, size: 20)
        }
    }

    var headlineFont: Font {
        switch self {
        case .default:
            return Font.custom(SFPro.bold.rawValue, size: 17)
        }
    }

    var bodyFont: Font {
        switch self {
        case .default:
            return Font.custom(SFPro.regular.rawValue, size: 17)
        }
    }

    var subheadlineFont: Font? {
        switch self {
        case .default:
            return Font.custom(SFPro.bold.rawValue, size: 15)
        }
    }

    var calloutFont: Font? {
        switch self {
        case .default:
            return Font.custom( SFPro.regular.rawValue, size: 16)
        }
    }

    var footnoteFont: Font? {
        switch self {
        case .default:
            return Font.custom( SFPro.regular.rawValue, size: 13)
        }
    }

    var caption1Font: Font? {
        switch self {
        case .default:
            return Font.custom(SFPro.regular.rawValue, size: 12)
        }
    }

    var caption2Font: Font? {
        switch self {
        case .default:
            return Font.custom(SFPro.regular.rawValue, size: 11)
        }
    }

}

let selectedThemeKey = "SelectedTheme"

enum ThemeManager {
    static var current: Theme {
        if let storedTheme = UserDefaults.standard.value(forKey: selectedThemeKey) as? Int {
            return Theme(rawValue: storedTheme)!
        } else {
            return .default
        }
    }

//    static func applyTheme(_ theme: Theme) {
//        UserDefaults.standard.setValue(theme.rawValue, forKey: selectedThemeKey)
//        UserDefaults.standard.synchronize()
//
//        let sharedApplication = UIApplication.shared
//        sharedApplication.delegate?.window??.tintColor = theme.mainColor
//        UITextField.appearance().tintColor = theme.textColor
//        UITextView.appearance().tintColor = theme.textColor
//
//        // Navigation Bar Appearance
//        if let font = theme.titleFont {
//            UINavigationBar.appearance().titleTextAttributes = [
//                NSAttributedString.Key.foregroundColor: theme.textColor,
//                NSAttributedString.Key.font: font
//            ]
//        }
//
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().tintColor = theme.mainColor
//        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().barTintColor = theme.backgroundColor
//
//        // Navigation Button appearance
//        let barButton = UIBarButtonItem.appearance()
//        if let font = theme.bodyFont {
//            barButton.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
//        }
//
//        if let font = theme._12Font {
//            UITabBarItem.appearance().setTitleTextAttributes(
//                [NSAttributedString.Key.font: font],
//                for: .normal
//            )
//            UITabBarItem.appearance().setTitleTextAttributes(
//                [NSAttributedString.Key.font: font],
//                for: .selected
//            )
//        }
//
//        if let font = theme._11Font {
//            UITabBarItem.appearance().setBadgeTextAttributes(
//                [NSAttributedString.Key.font: font],
//                for: .normal
//            )
//        }
//
//        UITabBar.appearance().backgroundColor = theme.backgroundColor
//        UITabBarItem.appearance().badgeColor = theme.mainColor
//
//        UITabBarItem.appearance().setTitleTextAttributes(
//            [NSAttributedString.Key.foregroundColor: theme.mainColor],
//            for: .selected
//        )
//        UITabBarItem.appearance().setTitleTextAttributes(
//            [NSAttributedString.Key.foregroundColor: Color(hexString: "0D0D0D")],
//            for: .normal
//        )
//    }
}
