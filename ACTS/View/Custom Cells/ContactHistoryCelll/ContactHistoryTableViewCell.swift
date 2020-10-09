//
//  ContactHistoryTableViewCell.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/24/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class ContactHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var dateOfContactLabel: UILabel!
    @IBOutlet weak var contactWithIdLabel: UILabel!
    @IBOutlet weak var firstContactLabel: UILabel!
    @IBOutlet weak var lastContactLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layoutSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
                let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    func setValuesToCell(_ dateOfContact: String, contactWithID: String,firstContact :String, lastContact:String) {
        dateOfContactLabel.text = dateOfContact
        contactWithIdLabel.text = contactWithID
        firstContactLabel.text = firstContact
        lastContactLabel.text = lastContact
    }
}
