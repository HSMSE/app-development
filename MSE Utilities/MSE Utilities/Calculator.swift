//
//  Calculator.swift
//  MSE Utilities
//
//  Created by Matthew Coudert & Alexandra Eagan on 10/24/17.
//  Copyright © 2017 HSMSE. All rights reserved.
//

import UIKit

class Calculator: UIViewController {
    
    @IBAction func handleGesture(_ sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.began
        {
            let alertController = UIAlertController(title: nil, message:
                "Long-Press Gesture Detected", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    @IBOutlet weak var display: UILabel!
    var operation = 0
    var firstInput = 0.0
    var secondInput = 0.0
    @IBAction func numbers(_ sender: UIButton) {
        let input = sender.tag
        switch input {
        // numbers 0-9
        case 0...9:
            display.text = display.text! + String(input)
            break
        // subtraction, addition, multiplication, division, exponent
        case 11...15:
            if(!(display.text==""||display.text==".")) {
                firstInput = Double(display.text!)!
                operation = input
                display.text = ""
            }
            break
        // clear
        case 16:
            operation = 0
            firstInput = 0
            secondInput = 0
            display.text = ""
            break
        // decimal
        case 17:
            if(!(display.text?.contains("."))!) {
                display.text = display.text! + "."
            }
            break
        // sign change
        case 18:
            if(display.text != "") {
                display.text = String(Double(display.text!)! * -1)
            }
            break
        // equals
        case 19:
            if(operation != 0) {
                secondInput = Double(display.text!)!
                display.text = String(operate())
                operation = 0
            }
            break
        // trig functions - sin, cos, tan, log
        case 20...23:
            secondInput = 0
            operation = input
            firstInput = Double(display.text!)!
            firstInput = operate()
            display.text = String(firstInput)
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
            if(secondInput != 0.0) {
                return firstInput/secondInput
            }
            return Double.nan
        case 15:
            return pow(firstInput, secondInput)
        case 20:
            return sin(firstInput * Double.pi / 180)
        case 21:
            return cos(firstInput * Double.pi / 180)
        case 22:
            return tan(firstInput * Double.pi / 180)
        case 23:
            return log10(firstInput)
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

