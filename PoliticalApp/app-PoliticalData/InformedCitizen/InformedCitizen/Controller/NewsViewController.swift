//
//  NewsViewController.swift
//  InformedCitizen
//
//  Created by Tom Marler on 1/30/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var newsclient: NewsClient = NewsClient()
    var newsserviceapi: NewsServiceAPI = NewsServiceAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsserviceapi.getSelectedStory(searchTitle: "bitcoin") { (json) in
            print(json)
        }
//        newsclient.fetchNews { (json) in
//            print(json)
//        }
        
    }
}
