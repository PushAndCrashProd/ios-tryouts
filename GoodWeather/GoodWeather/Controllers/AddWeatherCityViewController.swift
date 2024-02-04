//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 03/12/23.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(weatherVM: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    var delegate: AddWeatherDelegate?
    private var addWeatherViewModel = AddWeatherViewModel()
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityOnButtonPress() {
        if let city = cityNameTextField.text {
            addWeatherViewModel.addWeather(for: city) { weatherViewModel in
                self.delegate?.addWeatherDidSave(weatherVM: weatherViewModel)
                
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true)
    }
}
