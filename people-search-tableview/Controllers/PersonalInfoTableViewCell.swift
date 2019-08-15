//
//  PersonalInfoTableViewCell.swift
//  people-search-tableview
//
//  Created by David Rifkin on 8/15/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class PersonalInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
