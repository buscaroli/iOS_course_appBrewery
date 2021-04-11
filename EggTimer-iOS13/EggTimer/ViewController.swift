//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes : [String : Int] = ["Soft": 5, "Medium": 8, "Hard": 12]
    var seconds = 0
    var timer:Timer?
    var startingTime: Float = 0.0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
        timer?.invalidate()
        showBoilingTime(hardness!)
    }
    
    func showBoilingTime(_ hardness: String) {
        switch hardness {
        case "Soft":
            startTimer(eggTimes["Soft"]!)
        case "Medium":
            startTimer(eggTimes["Medium"]!)
        case "Hard":
            startTimer(eggTimes["Hard"]!)
        default:
            print("Something went South...")
        }
    }
    
    
    func startTimer(_ minutes: Int) {
        progressBar.progress = 1
        seconds = minutes * 60
        startingTime = Float(seconds)

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
    }
    
    @objc func fire()
    {
        // print("startingTime -> \(startingTime)")
        seconds -= 1
        let ratio = (Float(seconds))/startingTime
        // print(seconds)
        progressBar.progress = ratio
        // print(ratio)
        
        if seconds <= 0 {
            // print("Your Egg is Ready!")
            titleLabel.text = "Eggs are Ready!"
            progressBar.progress = 0
            timer?.invalidate()
        }
    }

}
