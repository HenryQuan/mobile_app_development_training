//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }

}

// MARK: - CoinManager delagate
extension ViewController: CoinManagerDelegate {
    
    func didFailed(with error: Error) {
        debugPrint(error)
    }
    
    func onReceived(data model: CoinModel?) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.1f", model?.rate ?? 0)
            self.currencyLabel.text = model?.asset_id_quote ?? "AUD"
        }
    }
    
}

// MARK: - UIPickerView related

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - UIPickerView data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    // MARK: - UIPickerView delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getConvertRate(at: row)
    }
    
}

