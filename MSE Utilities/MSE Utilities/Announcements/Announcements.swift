//
//  Announcements.swift
//  MSE Utilities
//
//  Created by Randolph Xia on 10/24/17.
//  Copyright © 2017 HSMSE. All rights reserved.
//

import UIKit

class Announcements: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var subjects = ["XC Team Makes States", "School Closed Monday", "Seniors Turn In Financial Aid!"]
    var announcements = ["The cross country team made states with 4th place last week. Seniors Abe Drogin and Michael Moriarty both broke school records.",
                         "School will be closed on Monday due to Martin Luther King Jr. Day.",
                         "Seniors! You must turn in your financial aid requests ASAP!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.backgroundColor = UIColor.clear
        myTableView.backgroundView = UIImageView(image: UIImage(named: "hsmse-logo.jpeg"))
        myTableView.frame = CGRect(origin: CGPoint(x: 20, y: 50), size: self.view.frame.size)
        
        //print(self.view.frame.size)
        
        //myTableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        
        myTableView.register(UINib(nibName: "DateCell", bundle: nil), forCellReuseIdentifier: "dateCell")
        myTableView.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "textCell")
        
        self.view.addSubview(myTableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAnnouncementsFromDate(_ date: Date) {
        //GET request to server
        
        /*
        let sampleAnnouncement:String = "{32187415612897: }"
        */
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcements.count + 1 //num of announcements + date cell
    }
    
    //Set cells to expand after any of them are tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let mainView = self.parent as! ViewController;
            
            let offset: CGPoint = CGPoint(x: mainView.view.frame.width * 2, y: 0)
            
            mainView.horizontalScrollView.setContentOffset(offset, animated: true)
            
        }
        if indexPath.row > 0 {
            var cell = tableView.cellForRow(at: indexPath) as! BaseCell
            cell.isCollapsed = !cell.isCollapsed

            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    //Decides height (changes for expansion)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let cell = tableView.cellForRow(at: indexPath) as! BaseCell? {
            if cell.requiredHeight != 0 {
                return cell.requiredHeight
            }
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.row) {
        case 0:
            let myCell = tableView.dequeueReusableCell(withIdentifier: "dateCell") as! DateCell
            
            return myCell
        default:
            let myCell = tableView.dequeueReusableCell(withIdentifier: "textCell") as! TextCell
            
            myCell.subjectLabel.text = subjects[indexPath.row - 1]
            myCell.contentLabel.text = announcements[indexPath.row - 1]
            return myCell
        }
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
