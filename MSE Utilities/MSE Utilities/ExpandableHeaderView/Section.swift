//
//  Section.swift
//  MSE Utilities
//
//  Created by Temp on 2/27/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import Foundation

struct Section {
    var subject: String!
    var text: String!
    var expanded: Bool!

    init(subject: String, text: String) {
        self.subject = subject
        self.text = text
        self.expanded = false
    }
    
    func getText() -> String {
        return text
    }
}
