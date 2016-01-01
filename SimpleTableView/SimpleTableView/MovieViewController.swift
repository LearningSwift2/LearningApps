//
//  MovieViewController.swift
//  SimpleTableView
//
//  Created by Phil Wright on 12/5/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class MovieViewController: UITableViewController {
    
    var service : MovieService?
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        service = MovieService(APIKey: "f51678dcb1e8e91622ee0f91f733ebb2")
        
        service?.getPopularMovies({ (results) -> Void in
            
            if let theMovies = results {
                
                self.movies = theMovies
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                    self.tableView.setNeedsDisplay()
                }
            }
        })
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as! MovieCell
        cell.configureCell(movies[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("index == \(indexPath.row)")
    }

}
