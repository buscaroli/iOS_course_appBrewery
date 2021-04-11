//
//  ViewController.swift
//  Billionaire
//
//  Created by Matteo on 06/04/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var btnALabel: UIButton!
    @IBOutlet weak var btnBLabel: UIButton!
    @IBOutlet weak var btnCLabel: UIButton!
    @IBOutlet weak var btnDLabel: UIButton!
    
    
    
    var quizBrain = QuizBrain()
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestion()
        scoreLabel.text = "£ " + String(quizBrain.getScore())
        btnALabel.setTitle(quizBrain.getA(), for: .normal)
        btnBLabel.setTitle(quizBrain.getB(), for: .normal)
        btnCLabel.setTitle(quizBrain.getC(), for: .normal)
        btnDLabel.setTitle(quizBrain.getD(), for: .normal)
        
        btnALabel.backgroundColor = UIColor.clear
        btnBLabel.backgroundColor = UIColor.clear
        btnCLabel.backgroundColor = UIColor.clear
        btnDLabel.backgroundColor = UIColor.clear
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    
    @IBAction func btnAPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel!.text
        
        
        
        if quizBrain.checkGameOver() {
            questionLabel.font = UIFont(name: "Palatino", size: 50.0)
            questionLabel.textColor = UIColor.yellow
            questionLabel.text = "Congratulations!"
            scoreLabel.font = UIFont(name:"Palatino", size: 60.0)
        } else {
            
            let rightAnswer = quizBrain.checkAnswer(userAnswer!)
            
            if rightAnswer {
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.orange
            }
            
            quizBrain.nextQuestion()
            // updateUI()
            
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
        
    }
    
}

