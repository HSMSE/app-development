//
//  TestCell.swift
//  MSE Utilities
//
//  Created by Temp on 1/3/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell, BaseCell {
    
    var isCollapsed: Bool = true
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        /*
        //Create tap recognize
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction(_:)))
        testLabel.addGestureRecognizer(tap)
        */
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func changeLabel(words: String) {
        testLabel.text = words
    }
    
    //what to do if tapped
    /*
    @objc func tapFunction(_ sender: UITapGestureRecognizer) {
        
    }
    */
}
