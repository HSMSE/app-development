//
//  ViewController.swift
//  MSE Utilities
//
//  Main View Controller for view scrolling feature
//
//  Created by Randolph Xia on 10/24/17.
//  Copyright © 2017 HSMSE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections = [
        Section(subject: "XC Team Wins States", text: "j fjdsa jfkl;dsa hflk;dsah l;sdaj flksadj flk;dsaj f;lksj ;laks j;sa ", expanded: false),
        Section(subject: "Girls Soccer Team Wins Nothing", text: "asdf jkl;asdf jkl; rueiopwq kdalfj asdkl;f uweop dsaf dsa fdsaf dsa", expanded: false),
        Section(subject: "Seniors Hand in Everything!!!", text: "qewr [poi qwer [pouewr ioepwruieowqpr ewioru eqwiorueqwio rueqwio", expanded: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


