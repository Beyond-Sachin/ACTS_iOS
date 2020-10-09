//
//  QuestionAnswerTableViewCell.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/27/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class QuestionAnswerTableViewCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesButtonImageView: UIImageView!
    @IBOutlet weak var noButtonImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setValuesToCell(_ questionLabel: String ){
        self.questionLabel.text = questionLabel
    }
}
