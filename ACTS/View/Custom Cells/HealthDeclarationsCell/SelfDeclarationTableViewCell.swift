//
//  SelfDeclarationTableViewCell.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/25/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class SelfDeclarationTableViewCell: UITableViewCell {
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var threeIIDLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
