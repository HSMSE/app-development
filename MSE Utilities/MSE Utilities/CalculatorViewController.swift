//
//  CalculatorViewController.swift
//  MSE Utilities
//
//  Created by Temp on 3/20/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import Foundation
import UIKit

class CalculatorViewController: UIViewController {
    

    @IBOutlet weak var WebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let htmlFile = Bundle.main.path(forResource: "desmos", ofType: "html")
        let html = try? String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)
        WebView.loadHTMLString(html!, baseURL: nil)
        
        //WebView.loadRequest(NSURLRequest(url: NSURL(fileURLWithPath:Bundle.main.path(forResource: "desmos.html", ofType: "html")!) as URL) as URLRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}


}
