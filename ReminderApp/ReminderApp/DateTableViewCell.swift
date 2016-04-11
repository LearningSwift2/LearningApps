//
//  DateTableViewCell.swift
//  ReminderApp
//
//  Created by Phil Wright on 4/8/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var datePicker: UIView!
    var isDatePickerHidden = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(currentDate: NSDate) {
        
    
        
        self.layoutIfNeeded()
    }
    
    func toggleDatePicker() {
        
        self.isDatePickerHidden = !self.isDatePickerHidden
    
        
    }


}
