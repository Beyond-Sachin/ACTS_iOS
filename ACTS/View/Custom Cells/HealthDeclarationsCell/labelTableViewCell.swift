//
//  labelTableViewCell.swift
//  AutoHeightIncrementTableViewDemo
//
//  Created by Appstute-Sachin on 9/26/20.
//  Copyright © 2020 Ashvin Gudaliya. All rights reserved.
//

import UIKit

class labelTableViewCell: UITableViewCell {

    @IBOutlet weak var diagnosisLabel: UILabel!
    let TitleArea: UILabel = UILabel(frame: CGRect(x: 30, y: 5, width: 350, height: 25))
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
     
    override func awakeFromNib() {
        super.awakeFromNib()
//        TitleArea.delegate = self
//        contentView.addSubview(TitleArea)
    }
     
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
     
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    


    
}
