//
//  MovieTableViewController.swift
//  SimpleTableView
//
//  Created by Phil Wright on 1/1/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var movies = ["One", "Two", "Three"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.movies[indexPath.row]
        return cell
    }



}
