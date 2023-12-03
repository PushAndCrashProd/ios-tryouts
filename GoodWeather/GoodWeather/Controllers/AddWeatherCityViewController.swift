//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 03/12/23.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityOnButtonPress() {
        
    }
    
    @IBAction func close() {
        self.dismiss(animated: true)
    }
}
