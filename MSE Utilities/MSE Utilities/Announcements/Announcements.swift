//
//  Announcements.swift
//  MSE Utilities
//
//  Created by Randolph Xia on 10/24/17.
//  Copyright © 2017 HSMSE. All rights reserved.
//

import UIKit

class Announcements: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.backgroundColor = UIColor.white
        myTableView.frame = CGRect(origin: CGPoint(x: 20, y: 50), size: self.view.frame.size)

        myTableView.register(UINib(nibName: "DateCell", bundle: nil), forCellReuseIdentifier: "dateCell")
        myTableView.register(UINib(nibName: "TestCell", bundle: nil), forCellReuseIdentifier: "testCell")
        
        self.view.addSubview(myTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 //equal to amount of events
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row) {
        case 0:
            return 217
            
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.row) {
        case 0:
            let myCell = tableView.dequeueReusableCell(withIdentifier: "dateCell") as! DateCell
            
            myCell.dateLabel.text = "some date"
            return myCell
            
        case 1:
            let myCell = tableView.dequeueReusableCell(withIdentifier: "testCell") as! TestCell
            
            myCell.testLabel.text = "some subject"
            return myCell
            
        default:
            //Blank cell, should never occur
            let myCell = tableView.dequeueReusableCell(withIdentifier: "testCell") as! TestCell
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
