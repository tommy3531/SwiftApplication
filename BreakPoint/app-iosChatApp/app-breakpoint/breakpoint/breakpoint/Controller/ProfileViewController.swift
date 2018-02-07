//
//  ProfileViewController.swift
//  breakpoint
//
//  Created by Tom Marler on 1/23/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var type = ProfileType.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProfileCollectionViewCell {
            cell.configureCell(index: indexPath.item, type: type)
            return cell
        }
        
        return ProfileCollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UserDataService.instance.setProfilePic(profilepic: "dark\(indexPath.item)")
        self.dismiss(animated: true, completion: nil)
    }
}
