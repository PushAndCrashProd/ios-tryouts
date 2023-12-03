//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Sri Hari Karthick on 30/11/23.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController, AddCoffeeOrderDelegate {
    
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateOrders()
    }
    
    // Delegate functions of AddCoffeeOrderDelegate
    func addCoffeeOrderViewDidClose(controller: UIViewController) {
        controller.dismiss(animated: true)
    }
    
    func addCoffeeOrderViewDidSave(order: Order, controller: UIViewController) {
        controller.dismiss(animated: true)
        
        let orderViewModel = OrderViewModel(order: order)
        self.orderListViewModel.ordersViewModel.append(orderViewModel)
        
        self.tableView.insertRows(at: [IndexPath.init(row: self.orderListViewModel.ordersViewModel.count - 1, section: 0)], with: .automatic)
    }
    
    private func populateOrders() {
        Webservice().load(resource: Order.all) { [weak self] result in
            
            switch result {
                case .success(let orders):
                    self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationController = segue.destination as? UINavigationController,
              let addCoffeeViewController = navigationController.viewControllers.first as? AddOrderViewController else {
            fatalError("Error performing Segue")
        }
        
        addCoffeeViewController.delegate = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        
        // Directly accessing labelText and detailedLabelText
        // is deprecated, this is the latest way of accessing the
        // labels.
        var cellContentConfig = cell.defaultContentConfiguration()
        
        cellContentConfig.text = vm.type
        cellContentConfig.secondaryText = vm.size
        
        cell.contentConfiguration = cellContentConfig
        
        return cell
    }
}
