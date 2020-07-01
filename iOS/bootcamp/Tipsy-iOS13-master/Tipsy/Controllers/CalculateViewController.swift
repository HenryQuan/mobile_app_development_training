//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

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
    }
    
    @IBAction func onStepperValueChanged(_ sender: UIStepper) {
        
    }
    
    @IBAction func onCalculateButtonPressed(_ sender: UIButton) {
        
        
    }
}

