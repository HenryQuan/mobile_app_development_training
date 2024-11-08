//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerProgressView: UIProgressView!
    
    private let eggTimes: [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    private var timer = Timer()
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        self.titleLabel.text = hardness
        let time = eggTimes[hardness!]! * 60
        var currentTime = 0
        
        // Cancel it first
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (t) in
            if currentTime < time {
                self.timerProgressView.progress = Float(currentTime) / Float(time)
                print("\(currentTime)s - \(time)s")
                currentTime += 1
            } else {
                t.invalidate()
                print("Completed!")
                self.timerProgressView.progress = 1.0
                self.titleLabel.text = "Done"
                // Play alarm sound?
                // From https://stackoverflow.com/a/31126202
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        }
        timer.fire()
    }
    
}
