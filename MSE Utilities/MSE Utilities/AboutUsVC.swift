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

struct Person {
    var name: String
    var position: String
    var quote: String
}


class AboutUsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let members = [
        Person(name: "Randolph Xia", position: "Founder / Co-Leader", quote: "Rensselaer Polytechnic Institute \nClass of 2022"),
        Person(name: "Max Li", position: "Co-Leader", quote: "University of Michigan \nClass of 2022"),
        Person(name: "Ben Kosten", position: "Backend Developer", quote: "University of Wisconsin–Madison \nClass of 2022"),
        Person(name: "Julian Torreno", position: "Backend Developer", quote: "University at Buffalo \nClass of 2022"),
        Person(name: "Matthew Coudert", position: "Frontend Developer", quote: "University of Saint Andrews \nClass of 2022"),
        Person(name: "Fatumata Jalloh", position: "Frontend Developer", quote: "Brandeis University \nClass of 2022"),
        Person(name: "Jennifer Cen", position: "Frontend Developer / Documenter", quote: "New York University \nClass of 2022"),
        Person(name: "Alexandra Eagan", position: "Frontend Developer / Documenter", quote: "Rensselaer Polytechnic Institute \nClass of 2022")
    ]
    
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
        
        //cell.imageCell.image = UIImage(named: members[indexPath.row])
        cell.nameCell.text = members[indexPath.row].name
        cell.positionCell.text = members[indexPath.row].position
        cell.descriptionCell.text = members[indexPath.row].quote
        
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

