//
//  DateCell.swift
//  MSE Utilities
//
//  Created by Temp on 1/2/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var datePickerVisible: Bool!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func showDatePickerCell() {
        
    }
    
    func hideDatePickerCell() {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
