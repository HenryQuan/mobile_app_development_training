//
//  WeatherManager.swift
//  Clima
//
//  Created by Yiheng Quan on 11/7/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=\(API_KEY)&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    private func performRequest(urlString: String) {
        print(urlString)
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                // Make sure the request was successful
                if error != nil {
                    print(error!)
                } else {
                    if let safeData = data {
                        self.parseJSON(data: safeData)
                    }
                }
            }
            
            // It says resume but it actually starts
            task.resume()
        }
    }
    
    private func parseJSON(data: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: data)
            let id = decodedData.weather[0].id
            print(getConditionName(weatherId: id))
        } catch {
            print(error)
        }
    }
    
    private func getConditionName(weatherId: Int) -> String {
        switch weatherId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
