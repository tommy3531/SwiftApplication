//
//  ViewController.swift
//  DataMiningAPIs
//
//  Created by Tom Marler on 6/21/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func getPerson(completion: @escaping(Error?) -> Void) {
        // Rest call takes time
        
        completion(nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPerson { error in
            
            // If error has a value copy to error and print out a message
            if let error = error {
                print("Ops! something went wrong..")
                
            // else no error
            } else {
                print("Its has finished")
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        print("Hello")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

