//
//  NewsAPI.swift
//  InformedCitizen
//
//  Created by Tom Marler on 1/30/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

// API KEY: 2126949bf7be437480eaf1f2dcf0ce51

import Foundation
import Networking
import SwiftyJSON

// https://newsapi.org/v2/everything?q=bitcoin&apikey=2126949bf7be437480eaf1f2dcf0ce51

struct NewsServiceAPI {
    
    func getSelectedStory(searchTitle: String, completed: @escaping (JSON?) -> ()) {
        
        let networking = Networking(baseURL: "https://newsapi.org/v2/everything?q=bitcoin&apikey=2126949bf7be437480eaf1f2dcf0ce51")
        networking.get("") { result in
            switch result {
            case .success(let response):
                let data = response.data
                let json = JSON(data)
            // Do something with JSON, you can also get arrayBody
                print(json)
            case .failure(let response):
                // Handle error
                print(response)
            }
        }
    }

}
