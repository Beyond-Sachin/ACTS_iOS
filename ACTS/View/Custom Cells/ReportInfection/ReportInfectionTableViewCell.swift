//
//  ReportInfectionTableViewCell.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/28/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class ReportInfectionTableViewCell: UITableViewCell {

    var delegate : ReportInfectionScreenDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func submitButton_Pressed(_ sender: Any) {
        self.delegate?.navigateToPreviousScreen()
    }
}
