//
//  TableViewController.swift
//  RockPaperScissors
//
//  Created by Adithya.A.N on 01/08/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        
        cell.textLabel?.text = cars[indexPath.row]
        
        return cell
    }
    
    @IBOutlet var myTableView: UITableView!
    var cars = [String]()
    var newCar: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        cars = ["BMW","Audi", "Volkswagen"]

        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    

}
