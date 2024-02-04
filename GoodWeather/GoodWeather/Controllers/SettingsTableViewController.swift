//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 05/12/23.
//

import Foundation
import UIKit

protocol SettingsDelegate {
    func settingsDone(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
    private var settingsViewModel = SettingsViewModel()
    var delegate: SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Uncheck everything
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            
            settingsViewModel.selectedUnit = unit;
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingsViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        var cellContentConfiguration = cell.defaultContentConfiguration()
        cellContentConfiguration.text = settingsItem.displayName
        
        cell.contentConfiguration = cellContentConfiguration
        
        if settingsItem == settingsViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    @IBAction func close() {
        if let delegate = self.delegate {
            delegate.settingsDone(vm: settingsViewModel)
        }
        self.dismiss(animated: true)
    }
}
