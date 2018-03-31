//
//  PropublicaBasicInformation.swift
//  InformedCitizen
//
//  Created by Tom Marler on 3/21/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class PropublicaBasicInformation: UIView {
    
    var propublicaModel: PropublicaModel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(propublicaModel: PropublicaModel){
        self.init()
        self.propublicaModel = propublicaModel
    }
    
    var firstNameLabel = UILabel()
    var lastNameLabel = UILabel()
    var state = UILabel()
    var party = UILabel()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
