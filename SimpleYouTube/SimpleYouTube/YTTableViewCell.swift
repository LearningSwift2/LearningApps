//
//  YTTableViewCell.swift
//  SimpleYouTube
//
//  Created by Phil Wright on 2/14/16.
//  Copyright © 2016 Touchopia. All rights reserved.
//

import UIKit

class YTTableViewCell: UITableViewCell {
    
    var video: Video?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
