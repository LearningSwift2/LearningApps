//
//  Movie.swift
//  MovieTV
//
//  Created by Phil Wright on 12/3/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import Foundation
import UIKit

    let movieImageURL = "http://image.tmdb.org/t/p/w500/"

struct Movie {
    
    let posterPath: String?
    let backdropPath: String?
    let title: String?
    let overview: String?
    let movieID: Int?
    let voteAverage: Double?
    let voteCount: Int?
    
    var posterImageView : UIImageView?
    
    init(jsonDictionary: [String:AnyObject]) {
        
        self.movieID = jsonDictionary["id"] as? Int
        
        if let path = jsonDictionary["poster_path"] as? String {
            self.posterPath = "\(movieImageURL)\(path)"
            let imageView = UIImageView()
            imageView.loadImageFromURL(NSURL(string: path)!)
            self.posterImageView = imageView
        } else {
            self.posterPath = ""
        }
        
        self.backdropPath = jsonDictionary["backgdrop_path"] as? String
        self.title = jsonDictionary["title"] as? String
        self.overview = jsonDictionary["overview"] as? String
        self.voteAverage = jsonDictionary["vote_average"] as? Double
        self.voteCount = jsonDictionary["vote_count"] as? Int
    }
}

extension Movie: CustomStringConvertible {
    var description: String {
        return "MovieId: \(movieID)\nTitle: \(title)\nOverview: \(overview)\n url: \(posterPath)\n"
    }
}