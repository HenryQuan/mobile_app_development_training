//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        weatherManager.delegate = self
    }

    @IBAction func searchPressed(_ sender: Any) {
        if let input = searchTextField.text {
            weatherManager.fetchWeather(cityName: input)
        }
        
        // This clears the text field so request first
        searchTextField.endEditing(true)
    }
    
    // MARK: Textfield delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchPressed(textField)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    // Should end editing is asking for permission
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            let alert = UIAlertController(title: "Warning", message: "City name has not been entered", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            // There are warning if you return false here but why?
            return true
        } else {
            return true
        }
    }
    
    // MARK: Weather manager delegate
    
    func didUpdateWeather(weather: WeatherModel) {
        print(weather.conditionName)
    }
    
}

