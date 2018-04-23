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
    var message: String!
    var expanded: Bool!

    init(subject: String, message: String) {
        self.subject = subject
        self.message = message
        self.expanded = false
    }
    
    func getMessage() -> String {
        return message
    }
}
