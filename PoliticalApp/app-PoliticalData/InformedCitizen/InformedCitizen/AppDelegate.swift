//
//  AppDelegate.swift
//  InformedCitizen
//
//  Created by Tom Marler on 1/30/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit
import CoreData

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        var configuration = Realm.Configuration.defaultConfiguration
        configuration.deleteRealmIfMigrationNeeded = true
        Realm.Configuration.defaultConfiguration = configuration
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = UINavigationController(rootViewController: PropublicaViewController())
//        window?.makeKeyAndVisible()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = PropublicaViewController()
        self.window!.rootViewController = rootViewController
        self.window!.backgroundColor = .white
        self.window!.makeKeyAndVisible()
        return true
    }
}

