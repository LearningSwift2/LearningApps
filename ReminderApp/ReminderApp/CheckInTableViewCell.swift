//
//  CheckInTableViewCell.swift
//  SimpleReminders
//
//  Created by Phil Wright on 4/4/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class CheckInTableViewCell: UITableViewCell {

    @IBOutlet weak var checkInBoolLabel: UILabel!
    @IBOutlet weak var checkInLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(checkInString: String, isChecked: Bool) {
        self.checkInLabel.font = ThemeManager.sharedInstance.defaultFont()
        self.checkInLabel.text = checkInString
        self.checkInBoolLabel.font = ThemeManager.sharedInstance.defaultFont()
        self.checkInBoolLabel.text = (isChecked ? "true" : "false")
        
        self.layoutIfNeeded()
    }
    
}
