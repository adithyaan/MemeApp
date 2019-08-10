//
//  CollectionViewController.swift
//  RockPaperScissors
//
//  Created by Adithya.A.N on 09/08/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class CollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionview: UICollectionView!
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var memes:[Meme.test]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memes = appDelegate.memes
    }

    override func viewWillAppear(_ animated: Bool) {
        memes = appDelegate.memes
        if(memes.count>0){
            print("view will appear in collection view"+String(memes[0].topText))
            collectionview!.reloadData()
//            collectionview.reloadData()
        }
    }

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print("in"+String(memes.count))
        return memes.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        print("****")
       cell.backgroundColor = .blue
        cell.textcell?.text = memes[indexPath.row].topText
        cell.img?.image = memes[indexPath.row].image
    
        return cell
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
