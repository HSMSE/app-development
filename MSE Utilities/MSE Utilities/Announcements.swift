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

        var myTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.backgroundColor = UIColor.white
        myTableView.frame = CGRect(x: 20, y: 50, width: 250, height: 400)
        
        myTableView.register(UINib(nibName: "TestCell", bundle: nil), forCellReuseIdentifier: "myIdentifier")
        
        self.view.addSubview(myTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myIdentifier") as! TestCell
        myCell.labelOne.text = "Row \(indexPath.row)"
        return myCell
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
