//
//  TableViewController.swift
//  SimpleTableViewDate
//
//  Created by Phil Wright on 1/10/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var dateToggle = true
    
    lazy var dateFormatter: NSDateFormatter = {
        var formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .ShortStyle
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerChanged()
    }
    
    func datePickerChanged () {
        detailLabel.text = dateFormatter.stringFromDate(datePicker.date)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if dateToggle && indexPath.section == 0 && indexPath.row == 1 {
            return 0
        }
        else {
            return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            toggleDatePickerForSelectedIndexPath(indexPath)
        }
    }

    @IBAction func datePickerHasChanged(sender: AnyObject) {
        datePickerChanged()
        
    }

    func toggleDatePickerForSelectedIndexPath(indexPath: NSIndexPath) {
        
        dateToggle = (dateToggle == true) ? false : true
        
        tableView.beginUpdates()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        tableView.endUpdates()
        
    }
}
