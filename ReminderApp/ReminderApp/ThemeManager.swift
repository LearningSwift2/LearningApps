//
//  ThemeManager.swift
//  SimpleReminders
//
//  Created by Phil Wright on 4/4/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

struct ThemeFont {
    static let defaultFontName = "Merriweather"
    static let defaultBoldFontName = "Merriweather-Bold"
    static let defaultFontSize: CGFloat = 16.0
}

class ThemeManager {
    
    // Setup ThemeManager as Singleton
    static let sharedInstance = ThemeManager()
    
    private init() {}
    
    func defaultFont() -> UIFont? {
        return UIFont(name: ThemeFont.defaultFontName, size: ThemeFont.defaultFontSize)
    }
    
    func defaultBoldFont() -> UIFont? {
        return UIFont(name: ThemeFont.defaultBoldFontName, size: ThemeFont.defaultFontSize)
    }
    
}