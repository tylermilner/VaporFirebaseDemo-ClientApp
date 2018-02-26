//
//  ViewController.swift
//  VaporFirebaseDemo-ClientApp
//
//  Created by Tyler Milner on 2/25/18.
//  Copyright © 2018 Tyler Milner. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var db = Firestore.firestore()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFirestoreRandomNumberListener()
    }
    
    // MARK: - Setup
    
    private func setupFirestoreRandomNumberListener() {
        db.collection("randomNumbers").document("theRandomNumber").addSnapshotListener { (snapshot, error) in
            guard let document = snapshot else {
                debugPrint("Error fetching random number document: \(String(describing: error))")
                return
            }
            
            debugPrint(document.data())
        }
    }
}
