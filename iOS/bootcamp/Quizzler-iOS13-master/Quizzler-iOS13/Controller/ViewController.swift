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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update the question
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answer = sender.currentTitle!
        let isCorrect = quiz.checkAnswer(answer)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
            print("Right!")
        } else {
            sender.backgroundColor = UIColor.red
            print("Wrong!")
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.updateUI()
        }
    }
    
    /** Update all UI items */
    func updateUI() {
        scoreLabel.text = quiz.getCurrentScoreString()
        questionLabel.text = quiz.getCurrentQuestion()
        
        let answers = quiz.getMultipleAnswers()
        firstButton.setTitle(answers[0], for: .normal)
        secondButton.setTitle(answers[1], for: .normal)
        thirdButton.setTitle(answers[2], for: .normal)
        
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        
        progressBar.progress = quiz.getCurrentProgress()
    }
}

