//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    private var height: Float = 1.5
    private var weight: Float = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onHeightSliderChanged(_ sender: UISlider) {
        height = sender.value
        heightLabel.text = String.init(format: "%.2f m", height)
    }
    
    @IBAction func onWeightSliderChanged(_ sender: UISlider) {
        weight = sender.value
        weightLabel.text = "\(Int(weight)) kg"
    }

    @IBAction func onCalculateButtonPressed(_ sender: UIButton) {
        print()
        let vc = SecondViewController()
        vc.bmiValue = computeBMI()
        self.performSegue(withIdentifier: "result", sender: self)
    }
    
    /** weight / height^2*/
    private func computeBMI() -> Float {
        return weight / pow(height, 2)
    }
}

