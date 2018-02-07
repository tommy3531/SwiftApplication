//
//  NewsAPI.swift
//  MeshUpApp
//
//  Created by Tom Marler on 1/23/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation
import Alamofire

// API KEY: 2126949bf7be437480eaf1f2dcf0ce51

class NewsAPIService {
    
    static let instance = NewsAPIService()
    
    func getRequest() {
        Alamofire.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=2126949bf7be437480eaf1f2dcf0ce51").responseJSON { (response) in
            if let result = response.result.value {
                let json = JSONEncoder(result)
                print(json)
            }
            
        }
    }
}
