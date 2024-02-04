//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 03/12/23.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    private var weatherListViewModel = WeatherListViewModel()
    private var lastSelectedUnit: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastSelectedUnit = Unit(rawValue: value)!
        }
    }
    
    func addWeatherDidSave(weatherVM: WeatherViewModel) {
        print(weatherVM)
        
        weatherListViewModel.addWeatherViewModel(weatherVM: weatherVM)
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = weatherListViewModel.getViewModel(at: indexPath.row)
        
        cell.configure(vm: weatherVM)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegureForSettingsTableViewController(segue: segue)
        }
    }
    
    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        guard let navigationController = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityViewController = navigationController.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        
        // Basically implement a protocol and send the instance over segue
        // so that the second controller calls the implemented function
        // for handling an event that happens.
        addWeatherCityViewController.delegate = self
    }
}

extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        if lastSelectedUnit.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            
            tableView.reloadData()
            lastSelectedUnit = vm.selectedUnit
        }
    }
    
    func prepareSegureForSettingsTableViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation controller not found!")
        }
        
        guard let settingsTvController = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("Unable to get SettingsTableViewController")
        }
        
        settingsTvController.delegate = self
    }
}
