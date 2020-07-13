//
//  WeatherManager.swift
//  Clima
//
//  Created by Yiheng Quan on 11/7/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailed(with error: Error)
}

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=\(API_KEY)&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(from cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: Double, longitude: Double) {
        let urlString = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    private func performRequest(with urlString: String) {
        print(urlString)
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                // Make sure the request was successful
                if error != nil {
                    self.delegate?.didFailed(with: error!)
                    return
                } else {
                    if let safeData = data {
                        if let weather = self.parseJSON(safeData) {
                            // How to pass this back???
                            self.delegate?.didUpdateWeather(self, weather: weather)
                        }
                    }
                }
            }
            
            // It says resume but it actually starts
            task.resume()
        }
    }
    
    private func parseJSON(_ data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: data)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            return WeatherModel(conditionId: id, cityName: name, temperature: temp)
        } catch {
            delegate?.didFailed(with: error)
            return nil
        }
    }
}
