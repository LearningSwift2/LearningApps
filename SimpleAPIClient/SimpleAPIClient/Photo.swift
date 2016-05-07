//
//  Photo.swift
//  WebServicesApp
//
//  Created by Phil Wright on 2/22/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class Photo {
    
    var photoID: String = ""
    var title: String = ""
    var urlString: String = ""
    var dateTaken = NSDate()
    
    private let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    init(jsonDict: JSONDictionary) {
        if let photoID = jsonDict["id"] as? String {
            self.photoID = photoID
        } else {
            print("Could not parse photoID")
        }
        
        if let title = jsonDict["title"] as? String {
            self.title = title
        } else {
            print("Could not parse title")
        }
        
        if let photoURLString = jsonDict["url_h"] as? String {
            self.urlString = photoURLString
            
            if let dateString = jsonDict["datetaken"] as? String {
                
                if let dateTaken = dateFormatter.dateFromString(dateString) {
                    self.dateTaken = dateTaken
                } else {
                    print("Could not parse dateTaken")
                }
            } else {
                debugPrint("Could not parse datetaken")
            }
        }
    }
    
}