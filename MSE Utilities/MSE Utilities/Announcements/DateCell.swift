//
//  DateCell.swift
//  MSE Utilities
//
//  Created by Temp on 1/2/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell, BaseCell {
    
    var isCollapsed: Bool = true
    
    var requiredHeight:CGFloat = 40

    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //set dateLabel to current date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        
        let date = Date()
        dateLabel.text = dateFormatter.string(from: date)

    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
