//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 05/12/23.
//

import Foundation

class WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(weatherVM: WeatherViewModel) {
        weatherViewModels.append(weatherVM)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func getViewModel(at index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    func toCelsius() {
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32) * 5 / 9
            
            return weatherModel
        }
    }
    
    func toFarenheit() {
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9 / 5) + 32
            
            return weatherModel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
            case .celsius:
                toCelsius()
            case .farenheit:
                toFarenheit()
        }
    }
}

class WeatherViewModel {
    let weather: WeatherResponse
    var temperature: Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var city: String {
        return self.weather.name
    }
    
    var humidity: Double {
        return self.weather.main.humidity
    }
}
