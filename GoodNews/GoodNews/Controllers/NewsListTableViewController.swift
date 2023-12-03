//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Sri Hari Karthick on 18/11/23.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    private var articleListViewModel: ArticleListViewModel!
    private var API_KEY: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Custom logic to be done once the view is loaded
        setup()
    }
    
    // Get the number of sections in TableView from the List View Model
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    // Get the number of rows in a given section from the list
    // view model
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    // Get the cell at the index and set the content fetched
    // from the webservice
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        
        return cell
    }
    
    private func setup() {
        API_KEY = ProcessInfo.processInfo.environment["API_KEY"]
        
        // To set the navigation controller title large
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(API_KEY!)")!
        Webservice().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
