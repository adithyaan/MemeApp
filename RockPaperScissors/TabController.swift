//
//  TabController.swift
//  RockPaperScissors
//
//  Created by Adithya.A.N on 02/08/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    
    var items:[UIBarButtonItem]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
//        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: )
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//        let toolbarItems = [add, spacer]
        tabBarController?.setToolbarItems(toolbarItems, animated: true)
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
