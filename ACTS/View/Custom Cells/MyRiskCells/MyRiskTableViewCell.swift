//
//  MyRiskTableViewCell.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/23/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class MyRiskTableViewCell: UITableViewCell {

    @IBOutlet weak var dateOfContact: UILabel!
    @IBOutlet weak var contactDiagnosisList: UITableView!
    @IBOutlet weak var contactWithID: UILabel!
    @IBOutlet weak var contactDiagnosisView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    class func createCell() {
      
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setValuesToCell(_ dateOfContact: String, contactWithID: String) {
        self.dateOfContact?.text = dateOfContact
        self.contactWithID?.text = contactWithID
    }
}
