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
    
    // MARK: - IBOutlets
    
    @IBOutlet private var randomNumberLabel: UILabel!
    @IBOutlet private var updatedDateLabel: UILabel!
    
    // MARK: - Properties
    
    private lazy var db = Firestore.firestore()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFirestoreRandomNumberListener()
    }
    
    // MARK: - Setup
    
    private func setupFirestoreRandomNumberListener() {
        db.collection("randomNumbers").document("theRandomNumber").addSnapshotListener { [weak self] (snapshot, error) in
            guard let snapshotData = snapshot?.data() else {
                debugPrint("Error fetching random number document: \(String(describing: error))")
                return
            }
            
            debugPrint("New random number: \(snapshotData)")
            
            self?.update(withRandomNumberSnapshot: snapshotData)
        }
    }
    
    // MARK: - Private
    
    private func update(withRandomNumberSnapshot snapshot: [String: Any]) {
        guard let number = snapshot["number"] else {
            debugPrint("Invalid random number snapshot. Missing 'number' key.")
            return
        }
        
        randomNumberLabel.text = "\(number)"
    }
}
