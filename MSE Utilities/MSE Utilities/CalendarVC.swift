//
//  CalendarVC.swift
//  MSE Utilities
//
//  Displays public Google calendar using WebView
//
//  Created by Max Li on 3/19/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSpinner.hidesWhenStopped = true
        
        let url = NSURL(string: Global.calendarURL)
        let request = NSURLRequest(url:url! as URL)
        webView.loadRequest(request as URLRequest)
        
        webView.scrollView.isScrollEnabled = false;
        webView.scrollView.bounces = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

extension CalendarVC: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ : UIWebView) {
        loadSpinner.startAnimating()
    }
    
    func webViewDidFinishLoad(_: UIWebView) {
        loadSpinner.stopAnimating()
    }
    
}
