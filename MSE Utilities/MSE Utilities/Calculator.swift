//
//  Calculator.swift
//  MSE Utilities
//
//  Created by Matthew Coudert & Alexandra Eagan on 10/24/17.
//  Copyright © 2017 HSMSE. All rights reserved.
//

import UIKit

class Calculator: UIViewController {

    @IBOutlet weak var display: UILabel!
    var operation = 0
    var firstInput = 0.0
    var secondInput = 0.0
    @IBAction func numbers(_ sender: UIButton) {
        let input = sender.tag
        switch input {
        case 1...9:
            display.text = display.text! + String(input)
            break
        case 10...15:
            if(!(display.text==""||display.text==".")) {
                firstInput = Double(display.text!)!
                operation = input
                display.text = ""
            }
            break
        case 16:
            operation = 0
            firstInput = 0
            secondInput = 0
            display.text = ""
            break
        case 17:
            if(!(display.text?.contains("."))!) {
                display.text = display.text! + "."
            }
            break
        case 18:
            display.text = String(Double(display.text!)! * -1)
            break
        case 19:
            if(operation != 0) {
                secondInput = Double(display.text!)!
                display.text = String(operate())
                operation = 0
            }
            break
        default:
            break
        }
    }
    
    func operate()->Double {
        switch operation {
        case 11:
            return firstInput-secondInput
        case 12:
            return firstInput+secondInput
        case 13:
            return firstInput*secondInput
        case 14:
            return firstInput/secondInput
        case 15:
            return pow(firstInput, secondInput)
        default:
            return 0
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
