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
        Question(text: "4 + 6 = 10", answer: "True"),
        Question(text: "10 + 6 + 4 = 15", answer: "False"),
        Question(text: "2 * 3 = 8", answer: "True")
    ]
    
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update the question
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answer = sender.currentTitle
        let correctAnswer = quiz[currentQuestion].answer
        
        if answer == correctAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        // Check if it is the end, convert to index
        if currentQuestion < quiz.count - 1 {
            currentQuestion += 1
        } else {
            currentQuestion = 0
        }
        
        updateUI()
    }
    
    /** Update all UI items */
    func updateUI() {
        questionLabel.text = quiz[currentQuestion].text
    }
}

