//
//  ShadowView.swift
//  breakpoint
//
//  Created by Tom Marler on 1/17/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }
}
