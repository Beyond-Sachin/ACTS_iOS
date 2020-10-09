//
//  CustomButton.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/22/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
//        setShadow()
//        setTitleColor(.white, for: .normal)
//        backgroundColor      = UIColor.systemBlue
//        titleLabel?.font     = UIFont(name: "AvenirNext-DemiBold", size: 18)
        layer.cornerRadius   = 5
//        layer.borderWidth    = 3.0
//        layer.borderColor    = UIColor.darkGray.cgColor
    }
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
}
