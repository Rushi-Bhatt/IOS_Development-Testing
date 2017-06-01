//
//  customeCell.swift
//  customCell
//
//  Created by Bhatt, Rushi on 5/31/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import UIKit

class CustomeCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var `switch`: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
