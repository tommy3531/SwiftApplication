//
//  FeedTVC.swift
//  breakpoint
//
//  Created by Tom Marler on 1/19/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class FeedTVC: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
        
    }
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImg.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
    func setupView() {
        //self.layer.backgroundColor = UIColor.white.cgColor
        //let yellowView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))

//        self.layoutMargins.top = 0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = 20
//        print(self.layoutMargins.bottom)
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
}
