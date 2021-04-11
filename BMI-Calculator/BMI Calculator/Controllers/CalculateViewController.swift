//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
// import Foundation // for NumberFormatter()


class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightSlider.value = 1.6
        weightSlider.value = 50
        heightLabel.text = "1.6m"
        weightLabel.text = "50Kg"
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
//        let formatter = NumberFormatter()
//        formatter.maximumFractionDigits = 2
//        formatter.minimumFractionDigits = 2
//        if let formattedString = formatter.string(for: sender.value) {
//            heightLabel.text = String(formattedString) + "m"
//        }
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
//        let formatter = NumberFormatter()
//        formatter.maximumFractionDigits = 0
//        formatter.minimumFractionDigits = 0
//        if let formattedString = formatter.string(for: sender.value) {
//            weightLabel.text = String(formattedString) + "Kg"
//        }
        weightLabel.text = String(format: "%.0f", sender.value) + "Kg"
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.colour = calculatorBrain.getColour()
            
        }
    }
}

