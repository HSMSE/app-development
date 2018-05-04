//
//  AnnouncementsVC.swift
//  MSE Utilities
//
//  Announcements View Controller
//
//  Created by Randolph Xia on 10/24/17.
//  Copyright © 2017 HSMSE. All rights reserved.
//

import UIKit

class AnnouncementsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var announcementsDateText: UITextField!
    @IBOutlet weak var yesterdayButton: UIButton!
    @IBOutlet weak var tomorrowButton: UIButton!
    
    private let refreshControl = UIRefreshControl()
    
    let announcementsURL: String = Global.serverURL + "/api/announcements"
    
    var dates: [String] = []
    var subjects: [String] = []
    var messages: [String] = []
    var sections: [Section] = []
    
    var currentDate: Date = Date.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.extendedLayoutIncludesOpaqueBars = true
        self.tableView.refreshControl = nil
        
        self.changeDateText(currentDate)
        getAnnouncements()
        
        //add refresh ability when setting up
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(getAnnouncements), for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toCalendar(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "calendarView")
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    @IBAction func toCalculator(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "calculatorView")
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    @IBAction func yesterday() {
        adjustToDate(Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!)
    }
    
    
    @IBAction func tomorrow() {
        adjustToDate(Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!)
    }
    
    @objc func getAnnouncements() {
        let request = NSMutableURLRequest(url: URL(string: announcementsURL)!)
        
        request.timeoutInterval = 5
        request.httpMethod = "GET"
        
        //parse response
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            //catch error
            if error != nil {
                self.refreshControl.endRefreshing()
                let alertController = UIAlertController(title: "Can't load announcements", message:
                    "Unable to connect to the server", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                return;
            }
            
            do {
                //store parsed data
                let JSONinfo = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [NSDictionary]

                DispatchQueue.main.async() {
                    self.dates.removeAll()
                    self.subjects.removeAll()
                    self.messages.removeAll()
                    self.sections.removeAll()
                    
                    if (JSONinfo!.count == 0) {
                        self.sections.append(Section(subject: "ERROR", message: "No announcements"))
                    } else {
                        for i in 0...JSONinfo!.count-1 {
                            Global.formatter.dateFormat = "yyyy-MM-dd"
                            self.dates.append("\(JSONinfo![i]["date"] as! String)")
                            self.subjects.append("\(JSONinfo![i]["subject"] as! String)")
                            self.messages.append("\(JSONinfo![i]["message"] as! String)")
                            if (self.dates[i] == Global.formatter.string(from: self.currentDate)) {
                                self.sections.append(Section(subject: self.subjects[i], message: self.messages[i]))
                            }
                        }
                    }
                    
                    self.tableView.reloadData() //tableView loads before, so we have to reload after adding sections
                    
                    self.refreshControl.endRefreshing()
                    
                    self.changeDateText(self.currentDate)
                }
            } catch {
                print("caught")
            }
        }
        task.resume()
    }
    
    func changeDateText(_ date: Date) {
        Global.formatter.dateFormat = "EEEE, MMMM dd, yyyy"
        announcementsDateText.text = Global.formatter.string(from: date)
    }
    
    func adjustToDate(_ date: Date) {
        currentDate = date
        changeDateText(date)
        Global.formatter.dateFormat = "yyyy-MM-dd"
        self.sections.removeAll()
        for i in 0...dates.count - 1 {
            if (self.dates[i] == Global.formatter.string(from: self.currentDate)) {
                self.sections.append(Section(subject: self.subjects[i], message: self.messages[i]))
            }
        }
        self.tableView.reloadData()
    }
    
}

extension AnnouncementsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = sections[indexPath.section].getMessage()
        return cell
    }
    
}

extension AnnouncementsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].subject, section: section, delegate: self)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded) {
            return UITableViewAutomaticDimension
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        header.textLabel?.frame = header.frame
    }
}

extension AnnouncementsVC: ExpandableHeaderViewDelegate {
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        tableView.beginUpdates()
        
        tableView.reloadRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
        
        tableView.endUpdates()
        
        if (sections[section].expanded) {
            tableView.scrollToRow(at: IndexPath(row: 0, section: section), at: UITableViewScrollPosition.none, animated: true)
        }
    }
    
}
