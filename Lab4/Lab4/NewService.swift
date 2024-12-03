//
//  NewService.swift
//  Lab4
//
//  Created by IPZ-31 on 02.12.2024.
//

import Foundation

class NewService {
    private let apiKey = "2a8658a3df784cb38a731a68e2073fac" // мій ключ
    private let baseUrl = "https://newsapi.org/v2/top-headlines"

    func fetchNews(country: String = "us", completion: @escaping (Result<[Article], Error>) -> Void) {
        guard var urlComponents = URLComponents(string: baseUrl) else { return }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "country", value: country),
            URLQueryItem(name: "apiKey", value: apiKey)
        ]
        
        guard let url = urlComponents.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else { return }
            
            do {
                let newResponse = try JSONDecoder().decode(NewResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(newResponse.articles))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}       
