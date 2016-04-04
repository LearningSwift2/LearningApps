//
//  ThemeManager.swift
//  SimpleReminders
//
//  Created by Phil Wright on 4/4/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ThemeManager {
    
    // Singleton
    static let sharedInstance = ThemeManager()
    private init() {}
    
    let defaultFontName = "Merriweather"
    let defaultBoldFontName = "Merriweather-Bold"
    let defaultFontSize: CGFloat = 16.0
    
    func defaultFont() -> UIFont? {
        return UIFont(name: self.defaultFontName, size: self.defaultFontSize)
    }
    
    func defaultBoldFont() -> UIFont? {
        return UIFont(name: self.defaultBoldFontName, size: self.defaultFontSize)
    }
}