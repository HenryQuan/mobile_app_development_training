//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        var time = eggTimes[hardness!]! * 60
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (t) in
            if time == 0 {
                t.invalidate()
                print("Completed!")
            } else {
                print("\(time)s remaining")
                time -= 1
            }
        }.fire()
    }
    
}
