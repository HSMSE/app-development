//
//  ViewController.swift
//  MSE Utilities
//
//  Main View Controller for view scrolling feature
//
//  Created by Randolph Xia on 10/24/17.
//  Copyright © 2017 HSMSE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var horizontalScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize views
        let announcementsView: Announcements = Announcements(nibName: "Announcements", bundle: nil)
        let calculatorView: Calculator = Calculator(nibName: "Calculator", bundle: nil)
        let calendarView: Calendar = Calendar(nibName: "Calendar", bundle: nil)
        
        //announcements view setup
        self.addChildViewController(announcementsView)
        self.horizontalScrollView.addSubview(announcementsView.view)
        announcementsView.didMove(toParentViewController: self)
        
        var annoVFrame: CGRect = announcementsView.view.frame
        //2nd view of three
        annoVFrame.origin.x = self.view.frame.width
        annoVFrame.size = self.view.frame.size
        announcementsView.view.frame = annoVFrame
        
        //calculator view setup
        self.addChildViewController(calculatorView)
        self.horizontalScrollView.addSubview(calculatorView.view)
        calculatorView.didMove(toParentViewController: self)
        
        var calcVFrame: CGRect = calculatorView.view.frame
        //left-most view
        calcVFrame.origin.x = 0
        calcVFrame.size = self.view.frame.size
        calculatorView.view.frame = calcVFrame
        
        //calendar view setup
        self.addChildViewController(calendarView)
        self.horizontalScrollView.addSubview(calendarView.view)
        calendarView.didMove(toParentViewController: self)
        
        var calVFrame: CGRect = calendarView.view.frame
        //3rd view of three
        calVFrame.origin.x = self.view.frame.width * 2
        calVFrame.size = self.view.frame.size
        calendarView.view.frame = calVFrame
        
        //setup horizontalScrollView
        self.horizontalScrollView.contentSize = CGSize(width: self.view.frame.width * 3, height:
            self.view.frame.height)
        
        //start at second view
        let offset: CGPoint = CGPoint(x: self.view.frame.width, y: 0)
        self.horizontalScrollView.setContentOffset(offset, animated: false)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

