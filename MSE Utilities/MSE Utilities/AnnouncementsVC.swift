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
    
    let formatter = DateFormatter()
    let datePicker = UIDatePicker()

    let announcementsURL = "http://10.58.80.231:3000/api/announcements"
    
    var subjects: [String] = []
    var messages: [String] = []
    
    var sections: [Section] = []
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.extendedLayoutIncludesOpaqueBars = true
        
        changeDateLabel(Date.init())
        createDatePicker()
        getAnnouncements()
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
    
    func changeDateLabel(_ date: Date) {
        formatter.dateFormat = "EEEE, MMMM dd, yyyy"
        announcementsDateText.text = formatter.string(from: date)
    }
    
    @objc func getAnnouncements() {
        
        self.refreshControl.endRefreshing()
        
        let request = NSMutableURLRequest(url: URL(string: announcementsURL)!)
        
        request.timeoutInterval = 5
        request.httpMethod = "GET"
        
        //parse response
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            //catch error
            if error != nil {
                let alertController = UIAlertController(title: "Can't load announcements", message:
                    "Unable to connect to the server", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                return;
            }
            
            do {
                //store parsed data
                let JSONinfo = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [NSDictionary]

                DispatchQueue.main.async() { //prevents error
                    self.sections.removeAll()
                    self.subjects.removeAll()
                    self.messages.removeAll()
                    self.tableView.reloadData()
                    
                    if (JSONinfo!.count == 0) {
                        self.sections.append(Section(subject: "ERROR", message: "No announcements"))
                    } else {
                        for i in 0...JSONinfo!.count-1 {
                            self.subjects.append("\(JSONinfo![i]["subject"] as! String)")
                            self.messages.append("\(JSONinfo![i]["message"] as! String)")
                            self.sections.append(Section(subject: self.subjects[i], message: self.messages[i]))
                        }
                    }
                    
                    self.tableView.reloadData() //tableView loads before, so we have to reload after adding sections
                }
            } catch {
                print("caught")
            }
        }
        task.resume()
    }
    
    func createDatePicker() {
        
        datePicker.datePickerMode = UIDatePickerMode.date;
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        announcementsDateText.inputAccessoryView = toolbar
        
        announcementsDateText.inputView = datePicker
        
    }
    
    @objc func donePressed() {
        formatter.dateFormat = "EEEE, MMMM dd, yyyy"
        announcementsDateText.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

extension AnnouncementsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //add refresh ability when setting up
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(getAnnouncements), for: .valueChanged)
        
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
