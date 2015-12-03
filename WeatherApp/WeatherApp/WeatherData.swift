//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Phil Wright on 12/2/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

struct WeatherData {
    var precipProbability: String = ""
    var precipIntensity: String = ""
    var time: String = ""
    
    init(dict: NSDictionary) {
        if let time = dict["time"] as? NSNumber {
            self.time = String(time)
        }
        if let precipProbability = dict["precipProbability"] as? String {
            self.precipProbability = precipProbability
        }
        if let precipIntensity = dict["precipIntensity"] as? String {
            self.precipIntensity = precipIntensity
        }
    }
}
