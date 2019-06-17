//
//  BorderView.swift
//  survey
//
//  Created by Linh.Nguyen on 7/6/18.
//  Copyright © 2018 STS. All rights reserved.
//

import UIKit

@IBDesignable

class BorderView: UIView {
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth/UIScreen.main.scale
        }
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.cornerRadius = self.cornerRadius
        self.layer.masksToBounds = true
        
        self.layer.borderWidth = self.borderWidth
    }
}

