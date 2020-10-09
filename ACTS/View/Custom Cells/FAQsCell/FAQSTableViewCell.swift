//
//  QSTableViewCell.swift
//  ACTS
//
//  Created by Sachin Pandit on 29/09/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class FAQSTableViewCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var expandableButton: UIButton!
    @IBOutlet weak var cardViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.expandableButton.setTitle( "OPEN", for: .normal)
        answerLabel.isHidden = true
        isQuestionExpanded = false
    }
    var isQuestionExpanded : Bool = false
    var delegate : ReloadTableViewDelegate?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func expandableButton_Pressed(_ sender: Any) {
        
        print(expandableButton.tag)
        if (self.isQuestionExpanded){
            self.isQuestionExpanded = !self.isQuestionExpanded
            self.answerLabel.isHidden = true
            self.expandableButton.setTitle( "OPEN", for: .normal)
        }else {
            self.isQuestionExpanded = !self.isQuestionExpanded
            self.answerLabel.isHidden = false
            self.expandableButton.setTitle( "CLOSE", for: .normal)
        }
        self.delegate?.reloadTableView(buttonTag: expandableButton.tag,buttonText: expandableButton.titleLabel?.text! ?? "")
    }
}
