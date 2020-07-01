//
//  Tips.swift
//  Tipsy
//
//  Created by Yiheng Quan on 1/7/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Tips {
    let splitNumber: Int
    let tips: Float
    let amountPerPerson: Float
    let totalAmount: Float
    
    init(split: Int, tips: Float, total: Float) {
        self.splitNumber = split
        self.tips = tips
        self.totalAmount = total * (1 + tips)
        self.amountPerPerson = totalAmount / Float(splitNumber)
    }
    
    func getDescription() -> String {
        // *100 to make it a percentage
        return String(format: "Split between %d people, with\n%.0f%% tip.", splitNumber, tips * 100)
    }
}
