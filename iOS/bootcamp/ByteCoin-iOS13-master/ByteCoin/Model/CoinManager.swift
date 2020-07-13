//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func onReceived(data model: CoinModel?)
    func didFailed(with error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getConvertRate(at index: Int) {
        // Convert row index to a string
        getConvertRate(for: currencyArray[index])
    }

    func getConvertRate(for currency: String) {
        // Since the picker if from currentArray so there is no way that the currency is invalid
        let url = "\(baseURL)/\(currency)?apikey=\(API_KEY)"
        performRequest(with: url)
    }
    
    private func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if (error != nil) {
                    self.delegate?.didFailed(with: error!)
                } else {
                    if let jsonData = data {
                        self.delegate?.onReceived(data: self.parseJSON(jsonData))
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(_ data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(CoinModel.self, from: data)
        } catch {
            delegate?.didFailed(with: error)
            return nil
        }
    }
    
}
