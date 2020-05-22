//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = [
        "4 + 6 = 10",
        "10 + 6 + 4 = 20",
        "2 * 3 = 8",
    ]
    
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update the question
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        currentQuestion += 1
        updateUI()
    }
    
    /** Update all UI items */
    func updateUI() {
        questionLabel.text = quiz[currentQuestion]
    }
}

