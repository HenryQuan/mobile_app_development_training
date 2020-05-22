//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Yiheng Quan on 22/5/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

class QuizBrain {
    
    var currentQuestion = 0
    var score = 0
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    func getCurrentQuestion() -> String {
        return quiz[currentQuestion].text
    }
    
    func getMultipleAnswers() -> [String] {
        return quiz[currentQuestion].answers
    }
    
    func getCurrentProgress() -> Float {
        return Float(currentQuestion + 1) / Float(quiz.count)
    }
    
    func getCurrentScoreString() -> String {
        return "Score: \(score)"
    }
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        let correct = userAnswer == quiz[currentQuestion].correct
        if correct {
            score += 1
        }
        
        nextQuestion()
        return correct
    }
    
    func nextQuestion() {
        // Check if it is the end, convert to index
        if currentQuestion < quiz.count - 1 {
            currentQuestion += 1
        } else {
            currentQuestion = 0
            score = 0
        }
    }
}
