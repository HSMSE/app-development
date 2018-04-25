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

    let motdURL = "http://10.58.80.231:3000/api/motd"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showAlert()
    }
    
    func showAlert() {
        let request = NSMutableURLRequest(url: URL(string: motdURL)!)
        
        request.httpMethod = "GET"
        
        //parse response
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            //catch error
            if error != nil {
                
                return;
            }
            
            do {
                //store parsed data
                let JSONinfo = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                DispatchQueue.main.async() { //prevents error
                    let alertController = UIAlertController(title: "Message of the Day", message:
                        JSONinfo?["m"] as? String, preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            } catch {
                print("caught")
            }
        }
        task.resume()
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
    
    
    @IBAction func toAboutUs(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "aboutUsView")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
}
