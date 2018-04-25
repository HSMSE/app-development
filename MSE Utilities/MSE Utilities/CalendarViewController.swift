//
//  CalendarViewController.swift
//  MSE Utilities
//
//  Created by Temp on 3/19/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var WebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://calendar.google.com/calendar/b/0/embed?showTitle=0&showPrint=0&showTabs=0&showCalendars=0&showTz=0&height=600&wkst=1&bgcolor=%23FFFFFF&src=publiccalendar@hsmse.org&color=%2323164E&ctz=America/New_York");
        let request = NSURLRequest(url:url! as URL);
        WebView.loadRequest(request as URLRequest)
        
        WebView.scrollView.isScrollEnabled = false;
        WebView.scrollView.bounces = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func toAnnouncements(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let thirdViewController = storyBoard.instantiateViewController(withIdentifier: "announcementsView")
        self.present(thirdViewController, animated:true, completion:nil)
    }
    
    @IBAction func toAboutUs(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "aboutUsView")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
}
