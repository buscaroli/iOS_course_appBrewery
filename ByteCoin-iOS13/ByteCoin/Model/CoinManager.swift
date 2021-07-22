//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCurrency(_ currencyManager: CoinManager, currency: CurrencyModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "Your_API_Key_Here"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    let bitCoinPrice = self.parseJSON(safeData)
                    self.delegate?.didUpdateCurrency(self, currency: bitCoinPrice! )
                }
                
            }
            task.resume()
        }
    }
    
    func parseJSON(_ currencyData: Data) -> CurrencyModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(Currency.self, from: currencyData)
            let rate = decodedData.rate
            let currencyName = decodedData.asset_id_quote
            // print(rate)
            // print(currencyName)
            let result = CurrencyModel(currencyName: currencyName, currencyValue: rate)
            return result
            
        } catch {
            print("Error")
            return nil
        }
    }
}


