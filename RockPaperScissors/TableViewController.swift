//
//  TableViewController.swift
//  RockPaperScissors
//
//  Created by Adithya.A.N on 01/08/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var m:[Any]=[]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return m.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        
//        cell.textLabel?.text = m[indexPath.row].topText
        
        return cell
    }
    
    @IBOutlet var myTableView: UITableView!
    var cars = [String]()
    var newCar: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        cars = ["BMW","Audi", "Volkswagen"]
//        var memes: [ViewController.Meme]! {
//            let object = UIApplication.shared.delegate
//            let appDelegate = object as! AppDelegate
//            return appDelegate.memes
//        }
         m = Meme(test:"test").getMovies()
        // Do any additional setup after loading the view.
        
//        navigationController?.setToolbarHidden(hidden:false, animated: false)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    

}
