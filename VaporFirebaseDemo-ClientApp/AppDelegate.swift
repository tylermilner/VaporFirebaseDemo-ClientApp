//
//  AppDelegate.swift
//  VaporFirebaseDemo-ClientApp
//
//  Created by Tyler Milner on 2/25/18.
//  Copyright © 2018 Tyler Milner. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupFirebase()
        
        return true
    }
    
    // MARK: - Private
    
    private func setupFirebase() {
        FirebaseApp.configure()
    }
}
