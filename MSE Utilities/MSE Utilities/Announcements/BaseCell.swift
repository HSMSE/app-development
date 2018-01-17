//
//  CellProtocol.swift
//  MSE Utilities
//
//  Created by Randolph Xia on 1/12/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import UIKit

protocol BaseCell {
    var isCollapsed:Bool {get set}
    var requiredHeight:CGFloat {get set}
}
