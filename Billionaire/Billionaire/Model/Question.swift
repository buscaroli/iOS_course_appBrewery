//
//  Question.swift
//  Billionaire
//
//  Created by Matteo on 06/04/2021.
//

import Foundation

struct Question {
    let text: String
    let answerA: String
    let answerB: String
    let answerC: String
    let answerD: String
    let correctAnswer: String
    
    init(q: String, aA: String, aB: String, aC: String, aD: String, correctA: String) {
        text = q
        answerA = aA
        answerB = aB
        answerC = aC
        answerD = aD
        correctAnswer = correctA
    }
    
}
