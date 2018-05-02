//
//  CalculatorVC.swift
//  MSE Utilities
//
//  Desmos API calculator
//
//  Created by Alexandra Eagan, Jennifer Cen on 3/20/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import Foundation
import UIKit

class CalculatorVC: UIViewController{
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadSpinner.hidesWhenStopped = true
        
        let htmlFile = Bundle.main.path(forResource: "desmos", ofType: "html")
        let html = try? String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)
        webView.loadHTMLString(html!, baseURL: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toAnnouncements(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "announcementsView")
        self.present(nextViewController, animated:true, completion:nil)
    }

    
    @IBAction func toAboutUs(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "aboutUsView")
        self.present(nextViewController, animated:true, completion:nil)
    }
}

extension CalculatorVC: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ : UIWebView) {
        loadSpinner.startAnimating()
    }
    
    func webViewDidFinishLoad(_: UIWebView) {
        loadSpinner.stopAnimating()
    }
    
}
