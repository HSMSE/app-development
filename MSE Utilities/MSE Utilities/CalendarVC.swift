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
    
    
    let calendarURL: String = "https://calendar.google.com/calendar/b/0/embed?showTitle=0&showPrint=0&showTabs=0&showCalendars=0&showTz=0&height=600&wkst=1&bgcolor=%23FFFFFF&src=publiccalendar@hsmse.org&color=%2323164E&ctz=America/New_York"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSpinner.hidesWhenStopped = true
        
        let url = NSURL(string: calendarURL);
        let request = NSURLRequest(url:url! as URL);
        webView.loadRequest(request as URLRequest)
        
        webView.scrollView.isScrollEnabled = false;
        webView.scrollView.bounces = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func toOpening(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "openingView")
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
