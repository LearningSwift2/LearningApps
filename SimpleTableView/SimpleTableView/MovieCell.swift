//
//  MovieCell.swift
//
//
//  Created by Phil Wright on 12/4/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var movie : Movie?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureCell(movie: Movie) {
        
        // save the movie
        self.movie = movie
        
        if let title = movie.title {
            self.titleLabel.text = title
        }
        
        if let path = movie.posterPath {
            let url = NSURL(string: path)!
            let request = NSURLRequest(URL: url)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                
                dispatch_async(dispatch_get_main_queue(), {
                    if let image = UIImage(data: data!) {
                        self.imageView?.image = image
                        
                        // Note to self: Make sure that the whole cell view contents need layout and not just the image view
                        // Otherwise it will not update at the first call
                        // NOT self.imageView?.setNeedsLayout()
                        self.setNeedsLayout()
                    }
                })
            })
            task.resume()
        }
    }
}
