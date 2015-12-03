//
//  ViewController.swift
//  WeatherApp
//
//  Created by Phil Wright on 12/2/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherDelegate {

    var weather : Weather?
    var manager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize API
        self.manager.delegate = self
        
        self.manager.request()
      
    }
    
    func updateWeather(weather: Weather) {
        print("The Weather!")
        
        self.weather = weather
        self.weather?.debugDump()
    }
    
}

