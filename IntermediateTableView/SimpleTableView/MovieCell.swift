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
        
        if let path = self.movie?.posterPath {
            guard let url = NSURL(string: path) else {
                print("Not a valid url")
                return
            }
            self.imageView?.loadImageFromURL(url)
        }
    }
}
