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
    @IBOutlet private var nextUpdateLabel: UILabel!
    
    // MARK: - Properties
    
    private lazy var db = Firestore.firestore()
    private weak var nextUpdateCountdownTimer: Timer?
    private var nextUpdate: Date?
    
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
    
    private func updateCountdownLabel(for nextUpdate: Date) {
        let now = Date()
        let timeRemaining = Int(nextUpdate.timeIntervalSince(now))
        
        nextUpdateLabel.text = "Next update in \(timeRemaining) seconds"
    }
    
    private func startCountdownTimer() {
        nextUpdateCountdownTimer?.invalidate()
        nextUpdateCountdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] (_) in
            guard let nextUpdate = self?.nextUpdate else { return }
            self?.updateCountdownLabel(for: nextUpdate)
        })
    }
    
    private func update(withRandomNumberSnapshot snapshot: [String: Any]) {
        guard let number = snapshot["number"] as? Int else {
            debugPrint("Invalid random number snapshot. Missing 'number' key.")
            return
        }
        guard let nextUpdate = snapshot["nextUpdate"] as? Date else {
            debugPrint("Invalid random number snapshot. Missing or invalid 'nextUpdate'.")
            return
        }
        
        self.nextUpdate = nextUpdate
        
        randomNumberLabel.text = "\(number)"
        updateCountdownLabel(for: nextUpdate)
        
        startCountdownTimer()
    }
}
