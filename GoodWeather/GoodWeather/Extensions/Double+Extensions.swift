//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 05/12/23.
//

import Foundation

extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}
