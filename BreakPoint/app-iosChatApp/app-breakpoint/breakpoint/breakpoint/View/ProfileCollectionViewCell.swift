//
//  ProfileCollectionViewCell.swift
//  breakpoint
//
//  Created by Tom Marler on 1/23/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit


enum ProfileType {
    case dark
    case light
}

class ProfileCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
    }
    
    func configureCell(index: Int, type: ProfileType){
        if type == ProfileType.dark {
            profileImage.image = UIImage(named: "dark\(index)")
        } else {
            print("Image is nil")
        }
    }
    
    func setupView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func displayImage(image: UIImage) {
        profileImage.image = image
    }
}
