//
//  GroupFeedTVC.swift
//  breakpoint
//
//  Created by Tom Marler on 1/21/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class GroupFeedTVC: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }

}
