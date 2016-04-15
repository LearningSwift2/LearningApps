//
//  MovieTableViewController.swift
//  SimpleTableView
//
//  Created by Phil Wright on 1/1/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: #selector(MovieTableViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        
        center.addObserver(self, selector: #selector(MovieTableViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)

        
        // Adjust for status bar
        self.tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieTableViewCell
        
        cell.configureCell("Enter Text",viewController: self)
        return cell
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
}
