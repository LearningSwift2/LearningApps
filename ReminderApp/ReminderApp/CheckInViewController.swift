//
//  CheckInViewController.swift
//  SimpleReminders
//
//  Created by Phil Wright on 3/25/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Check In"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CheckInCell", forIndexPath: indexPath) as! CheckInTableViewCell
        cell.configureCell("Check-In", isChecked: true)
        return cell
    }

    

}
