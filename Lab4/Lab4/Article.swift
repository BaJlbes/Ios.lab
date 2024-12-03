//
//  Article.swift
//  Lab4
//
//  Created by IPZ-31 on 02.12.2024.
//

import Foundation

struct NewResponse: Codable {
    let articles: [Article]
}

struct Article: Identifiable, Codable {
    let id = UUID() // Для унікального ідентифікатора
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let source: Source
}

struct Source: Codable {
    let name: String
}
