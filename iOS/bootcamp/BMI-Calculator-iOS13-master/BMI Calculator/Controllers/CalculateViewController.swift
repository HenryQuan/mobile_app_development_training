//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    var brain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onHeightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String.init(format: "%.2f m", sender.value)
    }
    
    @IBAction func onWeightSliderChanged(_ sender: UISlider) {
        weightLabel.text = "\(Int(sender.value)) kg"
    }

    @IBAction func onCalculateButtonPressed(_ sender: UIButton) {
        brain.computeBMI(weight: weightSlider.value, height: heightSlider.value)
        self.performSegue(withIdentifier: "result", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = brain.getBMIValue()
        }
    }
    
    
}

