//
//  PublicaTableViewCell.swift
//  InformedCitizen
//
//  Created by Tom Marler on 2/5/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class PublicaTableViewCell: UITableViewCell {
    
    // Basic Information
    var firstNameLabel: UILabel!
    var lastNameLabel: UILabel!
    var stateLabel: UILabel!

    
    // ************** ReadUp on why this works ************************************
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        basicInformation()
    }
    
    // ************** ReadUp on why this works ************************************
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        basicInformation()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let fontSize: CGFloat = selected ? 34.0 : 17.0
        self.firstNameLabel?.font = self.firstNameLabel?.font.withSize(fontSize)
    }
    
    
    
    func configureProfilePicture() {
        
    }
    
    func basicInformation() {
        let basicInformationView = UIView()
        let frame = CGRect(x: 0, y: 0, width: 400, height: 25)
        firstNameLabel = UILabel(frame: frame)
        lastNameLabel = UILabel(frame: frame)
        stateLabel = UILabel(frame: frame)
        basicInformationView.addSubview(firstNameLabel)
        basicInformationView.addSubview(lastNameLabel)
        basicInformationView.addSubview(stateLabel)
        // Each cell has a contentView Property
        self.contentView.addSubview(basicInformationView)
        
        // firstName
        firstNameLabel.textColor = UIColor.black
        firstNameLabel.textAlignment = .left
        firstNameLabel.font = UIFont(name: firstNameLabel.font.fontName, size: 12)
        
        // lastname
        lastNameLabel.textColor = UIColor.black
        lastNameLabel.textAlignment = .center
        lastNameLabel.font = UIFont(name: lastNameLabel.font.fontName, size: 12)
        
        stateLabel.textColor = UIColor.black
        stateLabel.textAlignment = .right
        stateLabel.font = UIFont(name: lastNameLabel.font.fontName, size: 12)
        
        // Cell background cover
        //self.contentView.backgroundColor = .white
    }

}
