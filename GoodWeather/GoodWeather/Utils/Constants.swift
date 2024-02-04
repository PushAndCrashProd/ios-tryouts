//
//  Constants.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 05/12/23.
//

import Foundation

struct Constants {
    struct Urls {
        static func urlForWeatherByCity(city: String) -> URL {
            let API_KEY = ProcessInfo.processInfo.environment["API_KEY"]!
            
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "metric"
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=\(API_KEY)&units=\(unit)")!
            
            print("Requesting: \(weatherURL)")
            
            return weatherURL
        }
    }
}
