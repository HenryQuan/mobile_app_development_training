//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Yiheng Quan on 22/5/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correct: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        correct = correctAnswer
    }
}
