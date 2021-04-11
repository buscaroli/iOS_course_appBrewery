//
//  QuizBrain.swift
//  Billionaire
//
//  Created by Matteo on 06/04/2021.
//

import Foundation

struct QuizBrain {
    
    var qIndex = 0
    var score = 0
    
    var quiz = [
        // ["Question", "Answer1", "Answer2", "Answer3", "Answer4", "Correct Answer: A | B | C | D"]
        Question(q: "What do they call football in the US?", aA: "Ball", aB: "Soccer", aC: "Softball", aD: "Rugby", correctA: "Soccer"),
        Question(q: "What is a Dolphin?", aA: "A Mammal", aB: "A Fish", aC: "An Amphibian", aD: "A Rocket", correctA: "A Mammal" ),
        Question(q: "Where is Stonehenge?", aA: "In Ireland", aB: "In the Isle of Mann", aC: "In England", aD: "Round the corner", correctA: "In England"),
        Question(q: "Where is Lake Garda", aA: "In France", aB: "In Croatia", aC: "In Italy", aD: "In Bournemouth", correctA: "In Italy"),
        Question(q: "Which of the following is a Romance language", aA: "German", aB: "Swedish", aC: "Romanian", aD: "Maltese", correctA: "Romanian"),
        Question(q: "Which country in in the Boreal emisphere?", aA: "Argentina", aB: "Qatar", aC: "Algeria", aD: "Mauritius", correctA: "Mauritius"),
        Question(q: "What is a Monad?", aA: "An Ice-cream flavour", aB: "A sub-tropical tree", aC: "A burrito", aD: "A female monk", correctA: "A burrito"),
        Question(q: "Which is not an Insect?", aA: "A Butterfly", aB: "A Ladybird", aC: "A Dragonfly", aD: "A Spider", correctA: "A Spider"),
        Question(q: "What is used to check the Blood Pressure?", aA: "A Sfigmomanometer", aB: "An Electro-pump", aC: "A Pmneumometer", aD: "An Hemostatic Lace", correctA: "A Sfigmomanometer"),
        Question(q: "Where is a Spinnaker used?", aA: "On a Plane", aB: "On a Sailboat", aC: "On a Car", aD: "In Bed", correctA: "On a Sailboat")
        
    ]
        
    func getScore() -> Int {
        return score
    }
    
    func getQuestion() -> String {
        return quiz[qIndex].text
    }
    
    func getA() -> String {
        return quiz[qIndex].answerA
    }
    
    func getB() -> String {
        return quiz[qIndex].answerB
    }
    
    func getC() -> String {
        return quiz[qIndex].answerC
    }
    
    func getD() -> String {
        return quiz[qIndex].answerD
    }
    
    mutating func nextQuestion() {
        if qIndex < quiz.count-1 {
            qIndex += 1
        } 
    }
    
    
    mutating func checkAnswer(_ pressedButton: String) -> Bool {
        if pressedButton == quiz[qIndex].correctAnswer {
            print(pressedButton)
            if score == 0 {
                score = 500
                return true
            } else {
                print("true")
                score *= 4
                return true
            }
        } else {
            print("false")
            return false
        }
    }
    
    func checkGameOver() -> Bool {
        if qIndex >= quiz.count-1 {
            return true
        } else {
            return false
        }
    }
}
