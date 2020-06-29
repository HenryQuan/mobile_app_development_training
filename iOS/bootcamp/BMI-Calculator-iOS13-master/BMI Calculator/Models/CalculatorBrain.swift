//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Yiheng Quan on 29/6/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bmiValue: Float?
    
    /** weight / height^2*/
    mutating func computeBMI(weight: Float, height: Float) {
        bmiValue = weight / pow(height, 2)
    }
    
    func getBMIValue() -> String {
        guard bmiValue != nil else { return "No value" }
        return String(format: "%.1f", bmiValue!)
    }
}
