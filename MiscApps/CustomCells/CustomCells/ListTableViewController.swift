//
//  ListTableViewController.swift
//  CustomCells
//
//  Created by Ben Gohlke on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if indexPath.row % 2 == 0
        {
            return 44.0
        }
        else
        {
            return 88.0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.row % 2 == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("ExampleCell", forIndexPath: indexPath) as! ExampleCell
            cell.leftLabel.text = "\(indexPath.row)"
            cell.rightLabel.text = "The Iron Yard"
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("AnotherCell", forIndexPath: indexPath) as! AnotherCell
            cell.aLabel.text = "is awesome!"
            return cell
        }
    }
}
