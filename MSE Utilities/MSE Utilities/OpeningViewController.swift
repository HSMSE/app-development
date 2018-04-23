//
//  OpeningViewController.swift
//  MSE Utilities
//
//  Created by Temp on 4/17/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import Foundation
import UIKit

class OpeningViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toAnnouncements(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let thirdViewController = storyBoard.instantiateViewController(withIdentifier: "announcementsView")
        self.present(thirdViewController, animated:true, completion:nil)
    }
    
    
    @IBAction func toCalculator(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let thirdViewController = storyBoard.instantiateViewController(withIdentifier: "calculatorView")
        self.present(thirdViewController, animated:true, completion:nil)
    }
    
    @IBAction func toCalendar(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "calendarView")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
}
