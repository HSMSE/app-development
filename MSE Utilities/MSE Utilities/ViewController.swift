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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var announcementsDateLabel: UILabel!
    
    let formatter = DateFormatter()
    
    let serverURL = "http://138.197.106.12:7777/app/v1.0/?task=announcements"
    
    var sections = [
        Section(subject: "XC Team Wins States",
                text: "They wo jld;ksaj fk;ldshlja jkhdsajkf sdjkh fdskj hdjskahflkjdsah fdjsak bmndsabvnsdbvnmds, bdahlkv dsakjvdlsk dja vjkadshvjdkavsmnbv mcnxbvmnc bvm,nc bvncbvasfdshljkfdsn"),
        Section(subject: "Girls Soccer Team Wins Nothing",
                text: "They are  fdsajhds dsm, bfdsanm, fbdsam,n fbdsam, fbkf gadkshfbeaskj fbdasmfdasm bfadkshb khads fkdhas f,hads bfm,ndas fm,das bfmndas b,dnsam, not very good"),
        Section(subject: "Seniors Hand in Everything!!!",
                text: "qewr [poi qwer [pouewr ioepw ruieowqpr ewioru eqwiorueqwj kldslkjkdl;saj l;ds jl;dksj l;adsfl;dsaj lksdaj ;lsajd;lk jsdklsjd;lfjsda;kl jfsda;lk jfsdalk jsdal;k jsd;alk jsd;lk fjsdalk jfsdal;k jfsd;lk jl;adsio rueqwio"),
        Section(subject: "Seniors Hand in Everything!!!",
                text: "qewr [poi qwer [pouewr ioepw ruieowqpr ewioru eqwiorueqwj kldslkjkdl;saj l;ds jl;dksj l;adsfl;dsaj lksdaj ;lsajd;lk jsdklsjd;lfjsda;kl jfsda;lk jfsdalk jsdal;k jsd;alk jsd;lk fjsdalk jfsdal;k jfsd;lk jl;adsio rueqwio"),
        Section(subject: "Seniors Hand in Everything!!!",
                text: "qewr  fjksh flsdah fkjldsahfkjldsah kjlfdsh flkjdsh fkjlsadh fkjladsh fjkladsh fkjdlash fjkdsa hfkdjas hkldjs fhkldasg f;i7wafgblekwa felawykv hleaw fgieyaw gfkewag fuew gfljewah fkleajwb kdjs fbhasdj faehkw evwui gh4piut n4[poi qwer [pouewr ioepw ruieowqpr ewioru eqwiorueqwj kldslkjkdl;saj l;ds jl;dksj l;adsfl;dsaj lksdaj ;lsajd;lk jsdklsjd;lfjsda;kl jfsda;lk jfsdalk jsdal;k jsd;alk jsd;lk fjsdalk jfsdal;k jfsd;lk jl;adsio rueqwio"),
        Section(subject: "Seniors Hand in Everything!!!",
                text: "qewr [poi qwer [pouewr ioepw ruieowqpr ewioru eqwiorueqwj kldslkjkdl;saj l;ds jl;dksj l;adsfl;dsaj lksdaj ;lsajd;lk jsdklsjd;lfjsda;kl jfsda;lk jfsdalk jsdal;k jsd;alk jsd;lk fjsdalk jfsdal;k jfsd;lk jl;adsio rueqwio"),
        Section(subject: "Seniors Hand in Everything!!!",
                text: "qewr [poi qwer [pouewr ioepw ruieowqpr ewioru eqwiorueqwj kldslkjkdl;saj l;ds jl;dksj l;adsfl;dsaj lksdaj ;lsajd;lk jsdklsjd;lfjsda;kl jfsda;lk jfsdalk jsdal;k jsd;alk jsd;lk fjsdalk jfsdal;k jfsd;lk jl;adsio rueqwio")
    ]
    
    @IBAction func click(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "calendarView")
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    @IBAction func toCalculator(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let thirdViewController = storyBoard.instantiateViewController(withIdentifier: "calculatorView")
        self.present(thirdViewController, animated:true, completion:nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.extendedLayoutIncludesOpaqueBars = true
        
        
        changeDateLabel(Date.init())
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeDateLabel(_ date: Date) {
        formatter.dateFormat = "EEEE, MMMM dd, yyyy"
        announcementsDateLabel.text = formatter.string(from: date)
    }
    
    /*
    func getAnnouncementsFromDate(_ date: Date) {
        let request = NSMutableURLRequest(url: URL(string: serverURL)!)
        
        request.httpMethod = "GET"
        
        //creating a task to send the post request
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            //exiting if there is some error
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
            
            //parsing the response
            do {
                //converting response to NSDictionary
                var announcementsJSON: NSDictionary!
                announcementsJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                //getting the JSON array teams from the response
                let dates: NSArray = announcementsJSON["dates"] as! NSArray
                
                //looping through all the json objects in the array teams
                for i in 0 ..< dates.count{
                    
                    //getting the data at each index
                    let teamID:Int = dates[i]["id"] as! Int!
                    let teamName:String = dates[i]["name"] as! String!
                    let teamMember:Int = dates[i]["member"] as! Int!
                    
                    //displaying the data
                    print("id -> ", teamId)
                    print("name -> ", teamName)
                    print("member -> ", teamMember)
                    print("===================")
                    print("")
                }
            } catch {
                print(error)
            }
        }
        //executing the task
        task.resume()
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].subject, section: section, delegate: self)
        return header
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = sections[indexPath.section].getText()
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        header.textLabel?.frame = header.frame
    }
  
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
