//
//  PropublicaDetailViewController.swift
//  InformedCitizen
//
//  Created by Tom Marler on 3/13/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class PropublicaDetailViewController: UIViewController {
    
    var propublicaModel: PropublicaModel!
    var propublicaDetailPanel: PropublicaDetailPanel!
    var propublicaSocialPanel: PropublicaSocialPanel!
    var propublicaBasicInformation: PropublicaBasicInformation!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(basicInformation: PropublicaBasicInformation, social: PropublicaSocialPanel, detailPanel: PropublicaDetailPanel) {
        self.propublicaDetailPanel = detailPanel
        self.propublicaSocialPanel = social
        self.propublicaBasicInformation = basicInformation
        super.init(nibName: nil, bundle: nil)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    /// TODO: Need to Clean this up
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainView = self.view!
        print(propublicaModel.firstName)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
