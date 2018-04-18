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

class ViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.extendedLayoutIncludesOpaqueBars = true
        
        changeDateLabel(Date.init())
        getAnnouncements();
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
        
        let thirdViewController = storyBoard.instantiateViewController(withIdentifier: "calculatorView")
        self.present(thirdViewController, animated:true, completion:nil)
        
    }
    
    func changeDateLabel(_ date: Date) {
        formatter.dateFormat = "EEEE, MMMM dd, yyyy"
        announcementsDateLabel.text = formatter.string(from: date)
    }
    
    func getAnnouncements() {
        let request = NSMutableURLRequest(url: URL(string: "https://localhost:3000")!)
        request.httpMethod = "GET"
        
        //parse response
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in

            //catch error
            if error != nil {
                print("error is \(String(describing: error))")
                return;
            }

            do {
                //store parsed data
                let testJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary

                //put in UILabel
                let info = (testJSON?.description)!
                DispatchQueue.main.async() { //prevents error
                    self.announcementsDateLabel.text = info
                }
            } catch {
                print("caught")
            }
        }

        task.resume()

    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = sections[indexPath.section].getText()
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
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

extension ViewController: ExpandableHeaderViewDelegate {
    
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
