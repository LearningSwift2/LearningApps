//
//  Weather.swift
//  WeatherApp
//
//  Created by Phil Wright on 12/2/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

struct Weather {
    
    var latitude : Double = 0.0
    var longitude : Double = 0.0
    var time : String = ""
    var summary : String = ""
    var minuteSummary: String = ""
    var dataPoints = [WeatherData]()
    
    init(dict : NSDictionary) {
        if let latitude = dict["latitude"] as? NSNumber {
            self.latitude = latitude.doubleValue
        }
        
        if let longitude = dict["longitude"] as? NSNumber {
            self.longitude = longitude.doubleValue
        }
        
        if let currently = dict["currently"] as? NSDictionary {
            if let time = currently["time"] as? String {
                self.time = time
            }
            if let summary = currently["summary"] as? String {
                self.summary = summary
            }
        }
        
        if let minutely = dict["minutely"] as? NSDictionary {
            if let summary = minutely["summary"] as? String {
                self.minuteSummary = summary
            }
            
            if let items = minutely["data"] as? NSArray {
                for object in items {
                    if let dict = object as? NSDictionary {
                        let data = WeatherData(dict: dict)
                        self.dataPoints.append(data)
                    }
                }
            }
        }
    }
    
    func debugDump() {
        print("latitude: \(latitude)")
        print("longitude: \(longitude)")
        print("time: \(time)")
        print("summary: \(summary)")
        print("minuteSummary: \(minuteSummary)")
        
        
    }
}
