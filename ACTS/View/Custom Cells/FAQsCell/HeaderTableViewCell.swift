//
//  HeaderTableViewCell.swift
//  ACTS
//
//  Created by Sachin Pandit on 30/09/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var cardHeightConstarints: NSLayoutConstraint!
    @IBOutlet weak var headerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
