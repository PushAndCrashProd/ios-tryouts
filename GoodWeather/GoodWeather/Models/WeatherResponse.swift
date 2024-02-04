//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 05/12/23.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
