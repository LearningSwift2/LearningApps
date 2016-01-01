//
//  UIImageView+LoadImageFromURL.swift
//  SimpleTableView
//
//  Created by Phil Wright on 1/1/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageFromURL(url: NSURL?) {
        
        guard let url = url else {
            print("Not a valid URL")
            return
        }
        
        let request = NSURLRequest(URL: url)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {
            (data, response, error) -> Void in
            
            if error == nil {
                
                guard let data = data else {
                    print("No data found")
                    return
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    if let image = UIImage(data: data) {
                        print("image loaded from url: \(url.absoluteString)")
                        self.image = image
                    }
                })
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        })
        task.resume()
    }
}
