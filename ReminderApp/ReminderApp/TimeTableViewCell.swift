//
//  TimeTableViewCell.swift
//  SimpleReminders
//
//  Created by Phil Wright on 4/4/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(titleString: String, timeString: String) {
        
        self.timeLabel.font = ThemeManager.sharedInstance.defaultFont()
        self.timeLabel.text = timeString
        
        self.layoutIfNeeded()
    }

}
