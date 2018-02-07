//
//  NewsClient.swift
//  InformedCitizen
//
//  Created by Tom Marler on 1/30/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

// API KEY: 2126949bf7be437480eaf1f2dcf0ce51

import Foundation
import SwiftyJSON

class NewsClient {
    
    func fetchNews(completed: @escaping (JSON) -> ()) {
        
        // Prepare URL
        //let newsAPIHeader = ["x-api-key": "2126949bf7be437480eaf1f2dcf0ce51"]
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apikey=2126949bf7be437480eaf1f2dcf0ce51"
        let apiKey = "SpzjlPZlkMlPKKGCLQS1OqZtCN96lPl7sszOTKra"
        let apiPayLoad = Data()
        
        // Need to convert string to Url
        let stringToUrl = URL(string: urlString)!
        
        // Need to build the request
        var urlRequest = URLRequest(url: stringToUrl)
        
        // Need a get Method
        urlRequest.httpMethod = "GET"
        
        // Set the API Key in the Header
        urlRequest.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        // Set the body of the Request to the apiPayLoad
        urlRequest.httpBody = apiPayLoad
        
        // Need to setup the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                completed(nil)
                return
            }
            let json = try! JSON(data: data!)
            completed(json)
        }
        task.resume()
    }
}
