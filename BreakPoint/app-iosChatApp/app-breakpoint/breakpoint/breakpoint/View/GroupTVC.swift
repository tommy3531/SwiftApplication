//
//  GroupTVC.swift
//  breakpoint
//
//  Created by Tom Marler on 1/21/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class GroupTVC: UITableViewCell {


    @IBOutlet weak var groupTitleLbl: UILabel!
    
    @IBOutlet weak var groupDescriptionLbl: UILabel!
    
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitleLbl.text = title
        self.groupDescriptionLbl.text = description
        self.memberCountLbl.text = "\(memberCount) members."

    }
    
}
