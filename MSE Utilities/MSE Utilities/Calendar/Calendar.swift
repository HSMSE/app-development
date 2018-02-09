//
//  Calendar.swift
//  MSE Utilities
//
//  Created by Randolph Xia on 10/24/17.
//  Copyright © 2017 HSMSE. All rights reserved.
//

import UIKit
import JTAppleCalendar

class Calendar: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)
        layout.itemSize = CGSize(width:30, height:30)
        
        let myCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        myCollectionView.backgroundColor = UIColor.white
        myCollectionView.frame = CGRect(origin: CGPoint(x: 20, y: 50), size: self.view.frame.size)
        
        //myCollectionView.separatorStyle = UICollectionViewCellSeparatorStyle.singleLine
        
        //myCollectionView.register(UINib(nibName: "CalDayCell", bundle: nil), forCellWithReuseIdentifier: "dayCell")
        myCollectionView.register(CalDayCell.self, forCellWithReuseIdentifier: "dayCell")
        
        self.view.addSubview(myCollectionView)
        
        // Do any additional setup after loading the view.
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as! CalDayCell
        cell.backgroundColor = UIColor.orange
        cell.date.text = "a"
        print(cell)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
