//
//  PublicaTableViewCell.swift
//  InformedCitizen
//
//  Created by Tom Marler on 2/5/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class PublicaTableViewCell: UITableViewCell {
    
    var firstNameLabel: UILabel!
    var lastNameLabel: UILabel!
    
    // ************** ReadUp on why this works ************************************
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    // ************** ReadUp on why this works ************************************
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let fontSize: CGFloat = selected ? 34.0 : 17.0
        self.firstNameLabel?.font = self.firstNameLabel?.font.withSize(fontSize)
    }
    
    func configureCell() {
        
        let frame = CGRect(x: 0, y: 0, width: 200, height: 25)
        firstNameLabel = UILabel(frame: frame)
        lastNameLabel = UILabel(frame: frame)
        
        // Each cell has a contentView Property
        contentView.addSubview(firstNameLabel)
        contentView.addSubview(lastNameLabel)
        
        // firstName
        firstNameLabel.textColor = UIColor.white
        firstNameLabel.textAlignment = .left
        firstNameLabel.font = UIFont(name: firstNameLabel.font.fontName, size: 12)

        // lastname
        lastNameLabel.textColor = UIColor.white
        lastNameLabel.textAlignment = .right
        lastNameLabel.font = UIFont(name: lastNameLabel.font.fontName, size: 12)
        
        // Cell background cover
        self.contentView.backgroundColor = .red
    }
}
