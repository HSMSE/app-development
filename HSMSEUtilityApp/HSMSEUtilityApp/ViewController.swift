//
//  ViewController.swift
//  HSMSEUtilityApp
//
//  Created by Max Li on 10/15/17.
//  Copyright © 2017 HSMSE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var horizontalScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize views
        var v1: View1 = View1(nibName: "View1", bundle: nil)
        var v2: View2 = View2(nibName: "View2", bundle: nil)
        var v3: View3 = View3(nibName: "View3", bundle: nil)
        
        //View1 setup
        self.addChildViewController(v1)
        self.horizontalScrollView.addSubview(v1.view)
        v1.didMove(toParentViewController: self)
        
        //View2 setup
        self.addChildViewController(v2)
        self.horizontalScrollView.addSubview(v2.view)
        v2.didMove(toParentViewController: self)
        
        var v2Frame: CGRect = v2.view.frame
        v2Frame.origin.x = self.view.frame.width
        v2.view.frame = v2Frame
        
        
        //View3 setup
        self.addChildViewController(v3)
        self.horizontalScrollView.addSubview(v3.view)
        v3.didMove(toParentViewController: self)
        
        var v3Frame: CGRect = v3.view.frame
        v3Frame.origin.x = self.view.frame.width * 2
        v3.view.frame = v3Frame
        
        
        //setup horizontalScrollView
        
        let offset: CGPoint = CGPoint(x: self.view.frame.width, y: 0)
        
        self.horizontalScrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.size.height)
        
        self.horizontalScrollView.setContentOffset(offset, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

