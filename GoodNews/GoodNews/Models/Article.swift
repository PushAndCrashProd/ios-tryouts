//
//  Article.swift
//  GoodNews
//
//  Created by Sri Hari Karthick on 18/11/23.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String?
    let description: String?
}
