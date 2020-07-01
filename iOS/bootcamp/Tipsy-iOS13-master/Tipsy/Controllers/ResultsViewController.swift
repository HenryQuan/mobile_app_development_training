//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Yiheng Quan on 1/7/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var tip: Tips?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f", tip?.amountPerPerson ?? 0.0)
        settingsLabel.text = tip?.getDescription() ?? ""
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
