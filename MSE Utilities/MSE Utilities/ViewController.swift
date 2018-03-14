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
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
