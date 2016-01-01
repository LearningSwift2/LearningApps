//
//  MovieTableViewController.swift
//  SimpleTableView
//
//  Created by Phil Wright on 1/1/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var movies = ["Star Wars IV - A new hope", "Star Wars V - The Empire Strikes Back", "Star Wars III = Revenge of the Sith"]

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Adjust for status bar
        self.tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)

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
