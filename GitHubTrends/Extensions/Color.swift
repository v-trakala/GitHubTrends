//
//  Color.swift
//  GitHubTrends
//
//  Created by Valery Trakala on 14/03/2025.
//

import SwiftUI

extension Color {
    static func createDynamicColor(darkColor: UIColor, lightColor: UIColor) -> UIColor {
        return UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? darkColor : lightColor
        }
    }
    
    static var cardBackground: Color {
        Color(uiColor: createDynamicColor(
            darkColor: UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1),
            lightColor: UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        ))
    }
    
    static var loaderBackground: Color {
        Color(uiColor: createDynamicColor(
            darkColor: UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1),
            lightColor: .black
        ))
    }
    
    static var cardShadow: Color {
        Color(uiColor: createDynamicColor(
            darkColor: UIColor.black.withAlphaComponent(0.6),
            lightColor: UIColor.gray.withAlphaComponent(0.3)
        ))
    }
    
    static var cardBorder: Color {
        Color(uiColor: createDynamicColor(
            darkColor: UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1),
            lightColor: UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        ))
    }
    
    static var cardTextPrimary: Color {
        Color(uiColor: createDynamicColor(
            darkColor: UIColor.white,
            lightColor: UIColor.black
        ))
    }
    
    static var cardTextSecondary: Color {
        Color(uiColor: createDynamicColor(
            darkColor: UIColor.gray,
            lightColor: UIColor.darkGray
        ))
    }
}
