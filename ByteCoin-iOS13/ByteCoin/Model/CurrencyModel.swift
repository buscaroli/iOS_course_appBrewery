//
//  CurrencyModel.swift
//  ByteCoin
//
//  Created by Matteo on 22/07/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CurrencyModel {
    let currencyName: String
    let currencyValue: Double
    
    var currencyValueStringified: String {
        return String(format: "%.2f", currencyValue)
    }
}
