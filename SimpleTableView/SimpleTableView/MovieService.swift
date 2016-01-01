//
//  ViewController.swift
//  MovieTV
//
//  Created by Phil Wright on 12/3/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import Foundation

struct MovieService {
    
    let movieAPIKey: String
    
    init(APIKey: String) {
        
        self.movieAPIKey = APIKey
    }
    
    func getPopularMovies(completion: ([Movie]? -> Void)) {
        
        guard let movieURL = NSURL(string: "http://api.themoviedb.org/3/movie/popular?api_key=\(movieAPIKey)")
        else {
            print("Could not construct a valid URL")
            return
        }
        
        let request = HTTPRequest(url: movieURL)
        
        request.GET { (let jsonDictionary) in

            var movies = [Movie]()
            
            let results = jsonDictionary?["results"] as! [AnyObject]

            for result in results {
                let r = result as! [String:AnyObject]
                let movie = Movie(jsonDictionary: r)
                movies.append(movie)
            }

            // Call Completion Block
            completion(movies)
        }
    }

}
