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
    var picture: String
}


class AboutUsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let members = [
        Person(name: "Randolph Xia", position: "Founder / Co-Leader", quote: "Rensselaer Polytechnic Institute \nClass of 2022", picture: "Samoyed.jpg"),
        Person(name: "Max Li", position: "Co-Leader", quote: "University of Michigan \nClass of 2022", picture: "German Shepherd.jpg"),
        Person(name: "Ben Kosten", position: "Backend Developer", quote: "University of Wisconsin–Madison \nClass of 2022", picture: "Wolf.jpg"),
        Person(name: "Julian Torreno", position: "Backend Developer", quote: "University at Buffalo \nClass of 2022", picture: "Poodle.jpeg"),
        Person(name: "Matthew Coudert", position: "Frontend Developer", quote: "University of Saint Andrews \nClass of 2022", picture: "Ginger Dog.jpg"),
        Person(name: "Fatumata Jalloh", position: "Frontend Developer", quote: "Brandeis University \nClass of 2022", picture: "Kitten.jpeg"),
        Person(name: "Jennifer Cen", position: "Frontend Developer / Documenter", quote: "New York University \nClass of 2022", picture: "Husky.jpg"),
        Person(name: "Alexandra Eagan", position: "Frontend Developer / Documenter", quote: "Rensselaer Polytechnic Institute \nClass of 2022", picture: "Chow Chow.jpg")
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
        
        
        cell.imageCell.image = UIImage(named: "Images/" + members[indexPath.row].picture)
        cell.imageCell.layer.masksToBounds = true
        cell.imageCell.layer.cornerRadius = 20
        
        cell.nameCell.text = members[indexPath.row].name
        cell.positionCell.text = members[indexPath.row].position
        cell.descriptionCell.text = members[indexPath.row].quote
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toOpening(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "openingView")
        self.present(nextViewController, animated:true, completion:nil)
    }
    

}
