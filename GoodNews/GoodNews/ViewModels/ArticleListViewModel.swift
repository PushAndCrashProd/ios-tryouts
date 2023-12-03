//
//  ArticleListViewModel.swift
//  GoodNews
//
//  Created by Sri Hari Karthick on 18/11/23.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        return ArticleViewModel(articles[index])
    }
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
    
    var title: String {
        return (self.article.title ?? "")
    }
    
    var description: String {
        return (self.article.description ?? "")
    }
}
