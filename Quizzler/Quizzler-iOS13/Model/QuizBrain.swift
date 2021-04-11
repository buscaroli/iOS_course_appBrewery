//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Matteo on 05/04/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question(q: "Four + Six equals Ten", a: "True"),
        Question(q: "A Cat is a Feline", a: "True"),
        Question(q: "A Dog ia a feline", a: "False"),
        Question(q: "Dolphins are mammals", a: "True"),
        Question(q: "The Sun is a not star", a: "False"),
        Question(q: "Libro is the Italian word for 'Book'", a: "True")
    ]
    
    
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    

}



