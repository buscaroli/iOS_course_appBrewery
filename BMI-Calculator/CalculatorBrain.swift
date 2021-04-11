//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Matteo on 11/04/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi : BMI?
    
    mutating func calculateBMI (height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat much more!", colour: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        } else if bmiValue < 24.5 {
            bmi = BMI(value: bmiValue, advice: "Well Done", colour: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        } else if bmiValue < 29.5 {
            bmi = BMI(value: bmiValue, advice: "Eat slightly less", colour: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
        } else if bmiValue < 39.5 {
            bmi = BMI(value: bmiValue, advice: "Start a diet", colour: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Start a Diet and Exercise daily", colour: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        return (String(format: "%.1f", bmi?.value ?? 0.0))
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Not sure what to say ..."
    }
    
    func getColour() -> UIColor {
        return bmi?.colour ?? #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
}
