//
//  TimeViewController.swift
//  SimpleReminders
//
//  Created by Phil Wright on 3/25/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private var tableView: UITableView!
    
    var dateCell: DateTableViewCell?
    var timeCell: TimeTableViewCell?
    
    lazy var dateFormatter: NSDateFormatter = {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(TimeViewController.updateDate), name: "DateHasChanged", object: nil)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Check In"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 44
        }
        
        if dateCell == nil || dateCell?.isDatePickerHidden == true {
            return 0
        }
        return 200
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            self.timeCell = tableView.dequeueReusableCellWithIdentifier("TimeCell", forIndexPath: indexPath) as? TimeTableViewCell
        
            self.timeCell?.configureCell("Time", timeString: "06:00 AM")
            
            return self.timeCell!
        }
        
        self.dateCell = tableView.dequeueReusableCellWithIdentifier("DateCell", forIndexPath: indexPath) as? DateTableViewCell
        
        self.dateCell?.configureCell(NSDate())
        
        self.updateDate()
        
        return self.dateCell!
    }
    
    //MARK: - Date Picker Method
    
    @IBAction func toggleDatePicker() {
        dateCell?.toggleDatePicker()
        tableView.reloadData()
    }
    
    func updateDate() {
        
        if let timeCell = self.timeCell,
        dateCell = self.dateCell {
            timeCell.timeLabel.text = self.dateFormatter.stringFromDate(dateCell.currentDate)
        } else {
            print("TimeCell or DateCell missing")
        }
        
    }

    
}
