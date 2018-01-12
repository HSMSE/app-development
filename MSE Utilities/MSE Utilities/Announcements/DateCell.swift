//
//  DateCell.swift
//  MSE Utilities
//
//  Created by Temp on 1/2/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell, BaseCell{
    
    var isCollapsed: Bool = true {
        didSet {
            if (isCollapsed) {
                datePicker.isHidden = true
            } else {
                datePicker.isHidden = false
            }
        }
    }

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        datePicker.isHidden = true
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
