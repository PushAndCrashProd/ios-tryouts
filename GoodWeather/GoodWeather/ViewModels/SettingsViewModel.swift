//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 05/12/23.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case farenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch(self) {
                case .celsius:
                    return "Celsius"
                case .farenheit:
                    return "Farenheit"
            }
        }
    }
}

class SettingsViewModel {
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
            let userDefault = UserDefaults.standard
            var unitValue = ""
            if let value = userDefault.value(forKey: "unit") as? String {
                unitValue = value
            } else {
                unitValue = Unit.farenheit.rawValue
            }
            
            return Unit(rawValue: unitValue)!
        }
        
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
}
