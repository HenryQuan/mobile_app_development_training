//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    private let eggTimes: [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    private var timer = Timer()
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        var time = eggTimes[hardness!]!
        
        // Cancel it first
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (t) in
            if time == 0 {
                t.invalidate()
                print("Completed!")
                self.titleLabel.text = "DONE"
            } else {
                print("\(time)s remaining")
                time -= 1
            }
        }
        timer.fire()
    }
    
}
