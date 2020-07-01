//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var percentage: Float = 0.1
    var splitNumber: Int = 2
    var tip: Tips?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    private func resetButtonSelection() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }

    @IBAction func onTipChanged(_ sender: UIButton) {
        resetButtonSelection()
        sender.isSelected = true
        // I set the tag to 0, 1, 2 so just divide by 10
        percentage = Float(sender.tag) / 10.0
        billTextField.endEditing(true)
    }
    
    @IBAction func onStepperValueChanged(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        splitNumberLabel.text = "\(splitNumber)"
    }
    
    @IBAction func onCalculateButtonPressed(_ sender: UIButton) {
        if let input = billTextField.text {
            // If input is not valid, make it zero
            self.tip = Tips(split: self.splitNumber, tips: self.percentage, total: Float(input) ?? 0.0)
            
            self.performSegue(withIdentifier: "result", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
            let vc = segue.destination as! ResultsViewController
            vc.tip = self.tip
        }
    }
}

