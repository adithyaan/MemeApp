//
//  TableCellTableViewCell.swift
//  RockPaperScissors
//
//  Created by Adithya.A.N on 09/08/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class TableCellTableViewCell: UITableViewCell {

    @IBOutlet var textcell: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
