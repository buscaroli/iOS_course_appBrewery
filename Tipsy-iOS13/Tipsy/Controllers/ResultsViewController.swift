//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Matteo on 18/04/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var perPersonBill: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = perPersonBill
    }
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
