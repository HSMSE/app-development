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
    var secondNumber:Double = 0
    var previousNumber:Double = 0
    var firstInput = false
    var operationInput = false
    var operationInputText = false
    @IBAction func numbers(_ sender: UIButton) {
        let input = Int(sender.tag)
        if((input>=0 && input<=10)||input==17||input==18) {
            if(operationInputText) {
                display.text = ""
                operationInputText = false
            }
            firstInput = true
            if(input == 17) {
                display.text = display.text! + "."
            } else if(input>=0 && input<=10) {
                display.text = display.text! + String(input)
            }
            if(input == 18) {
                if(display.text != "") {
                    display.text = String((Double(display.text!)! * -1.0))
                } else {
                    display.text = "-"
                }
            }
        }
        if(input == 16) {
            display.text = ""
            previousNumber = 0
            secondNumber = 0
            firstInput = false
            operationInput = false
            operationInputText = false
        }
        if(input>=11 && input<=14 && firstInput) {
            if(operationInput) {
                previousNumber = Double(getOutput())!
            } else {
                previousNumber = Double(display.text!)!
            }
            if(input == 11) { operation = 1 }
            if(input == 12) { operation = 2 }
            if(input == 13) { operation = 3 }
            if(input == 14) { operation = 4 }
            display.text = String(previousNumber)
            operationInput = true
            operationInputText = true
        }
        if(input == 15 && operationInput) {
            display.text = getOutput()
            previousNumber = Double(display.text!)!
            operationInput = false;
        }
    }
    
    func getOutput()->String {
        secondNumber = Double(display.text!)!
        if(operation == 1) { return String(previousNumber + secondNumber) }
        if(operation == 2) { return String(previousNumber - secondNumber) }
        if(operation == 3) { return String(previousNumber * secondNumber) }
        if(operation == 4) { return String(previousNumber / secondNumber) }
        return ""
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
