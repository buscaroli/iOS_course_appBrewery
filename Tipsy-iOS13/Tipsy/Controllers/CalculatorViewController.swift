//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var currentTip: Float = 0.1
    var peopleNumber: Int = 2
    var billTotal: Float = 0.0
    var billPerPerson: String = "0.0"
    
    let stepper = UIStepper()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        if zeroPctButton.isSelected == true {
            currentTip = 0.0
        }
        if tenPctButton.isSelected == true {
            currentTip = 0.1
        }
        if twentyPctButton.isSelected == true {
            currentTip = 0.2
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        peopleNumber = Int(sender.value)
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            billTotal = Float(bill)!
            let result = billTotal * (1 + currentTip) / Float(peopleNumber)
            billPerPerson = String(format: "%.2f", result)
            // print(billPerPerson)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.perPersonBill = billPerPerson
        }
    }
}
