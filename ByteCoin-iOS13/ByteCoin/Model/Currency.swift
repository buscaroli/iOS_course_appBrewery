//
//  Currency.swift
//  ByteCoin
//
//  Created by Matteo on 22/07/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Currency: Codable {
    var rate: Double
    var asset_id_quote: String
}
