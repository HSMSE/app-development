//
//  AboutUsVC.swift
//  MSE Utilities
//
//  Info view displaying group members
//
//  Created by Alexandra Eagan on 4/25/18.
//  Copyright © 2018 HSMSE. All rights reserved.
//

import Foundation
import UIKit

class AboutUsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!

    let members = ["Randolph Xia", "Max Li", "Ben Kosten", "Julian Torreno", "Matthew Coudert", "Fatumata Jalloh", "Jennifer Cen", "Alexandra Eagan"]

    let positions = ["Founder / Co-Leader", "Co-Leader", "Backend Developer", "Backend Developer", "Frontend Developer", "Frontend Developer", "Frontend Developer / Documenter", "Frontend Developer / Documenter"]



    override func viewDidLoad() {

        collectionView.delegate = self
        collectionView.dataSource = self

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell

        //cell.imageCell.image = UInt(named: members[indexPath.row])
        cell.nameCell.text = members[indexPath.row]
        cell.positionCell.text = positions[indexPath.row]

        return cell
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

    @IBAction func toCalculator(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "calculatorView")
        self.present(nextViewController, animated:true, completion:nil)
    }
}
