//
//  APIClient.swift
//  WeatherApp
//
//  Created by Phil Wright on 12/2/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

protocol WeatherDelegate {
    func updateWeather(weather: Weather)
}

class NetworkManager {
    
    var delegate: WeatherDelegate?
    
    let baseURL: String = "https://api.forecast.io/forecast/34dab86640f64ddcb012ac6e009e7e22/"
    
    func request(latitude: String = "37.8267", longitude: String = "-122.423") {
 
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        let url = NSURL(string: baseURL + latitude + "," + longitude)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let statusCode = (response as! NSHTTPURLResponse).statusCode
            print("URL Session Task Succeeded: HTTP \(statusCode)")
            
            
            do {
                let parsedObject: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                
                if let dict = parsedObject as? NSDictionary {
                    let w = Weather(dict: dict)
                    print(w.latitude)
                    print(w.longitude)
                    print(w.time)
                    print(w.summary)
                    print(w.minuteSummary)
                    
                    for point in w.dataPoints {
                        print(point.time)
                    }
                    
                    if self.delegate != nil {
                        self.delegate?.updateWeather(w)
                    }
                }
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        })
        task.resume()
    }

}
