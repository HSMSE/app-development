//
//  TextCell.swift
//  MSE Utilities
//
//  Created by Temp on 1/17/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell, BaseCell {
    
    var isCollapsed: Bool = true {
        didSet {
            if (isCollapsed) {
                contentLabel.isHidden = true
            } else {
                contentLabel.isHidden = false
            }
            
            //update requiredHeight
            requiredHeight = 0
            for subview in contentView.subviews {
                if !subview.isHidden {
                    requiredHeight += subview.frame.size.height
                }
            }
        }
    }
    
    var requiredHeight: CGFloat = 0
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentLabel.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
