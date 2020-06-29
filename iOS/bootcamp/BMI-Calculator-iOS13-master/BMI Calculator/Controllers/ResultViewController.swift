//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Yiheng Quan on 29/6/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue: String = "No value"
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.resultLabel.text = String.init(format: "%.1f", bmiValue)
    }
    
    @IBAction func onRecalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
