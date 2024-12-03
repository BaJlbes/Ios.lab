//
//  NewsViewModel.swift
//  Lab4
//
//  Created by IPZ-31 on 02.12.2024.
//

import Foundation

class NewViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

     let newService = NewService()

    func fetchNews() {
        isLoading = true
        errorMessage = nil
        
        newService.fetchNews { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            switch result {
            case .success(let articles):
                self.articles = articles
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
