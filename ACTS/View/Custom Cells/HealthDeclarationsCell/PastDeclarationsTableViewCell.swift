//
//  PastDeclarationsTableViewCell.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/25/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit
import SideMenuSwift

class PastDeclarationsTableViewCell: UITableViewCell {
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var pastDeclarationButton: CustomButton!
    @IBOutlet weak var labelWidth: NSLayoutConstraint!
    
    @IBOutlet weak var cardHeightConstraints: NSLayoutConstraint!
    var delegate : ReportInfectionScreenDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func viewDeclarationButton_Pressed(_ sender: Any) {
        AppDelegate.sharedInstance().isFromFromReportInfectionScreen =  false
        self.delegate?.navigateToReportInfectionScreen(isFromFromReportInfection : false)
    }
}
