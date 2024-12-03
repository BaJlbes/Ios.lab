//
//  ViewModel.swift
//  Lab3(1)
//
//  Created by IPZ-31 on 02.12.2024.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    // Масив усіх погодних даних
    @Published var weatherData: [Weather] = []
    
    // Масив відфільтрованих даних для відображення
    @Published var filteredWeatherData: [Weather] = []
    
    init() {
        loadMockData()
    }
    
    // Завантаження тестових даних
   func loadMockData() {
        let MockData = [
            Weather(city: "New York", temperature: 22.5, humidity: 60, pressure: 1012, condition: .sunny),
            Weather(city: "London", temperature: 18.0, humidity: 80, pressure: 1008, condition: .cloudy),
            Weather(city: "Tokyo", temperature: 25.0, humidity: 70, pressure: 1010, condition: .rainy)
        ]
        self.weatherData = MockData
        self.filteredWeatherData = MockData
    }
    
    // Фільтрація за містом або станом погоди
    func filterWeather(byCity city: String? = nil, byCondition condition: WeatherCondition? = nil) {
        filteredWeatherData = weatherData.filter { weather in
            var matchesCity = true
            var matchesCondition = true
            
            if let city = city, !city.isEmpty {
                matchesCity = weather.city.lowercased().contains(city.lowercased())
            }
            
            if let condition = condition {
                matchesCondition = weather.condition == condition
            }
            
            return matchesCity && matchesCondition
        }
    }
}

// Модель даних
struct Weather: Identifiable {
    let id = UUID()
    let city: String
    let temperature: Double
    let humidity: Double
    let pressure: Double
    let condition: WeatherCondition
}

// Стан погоди
enum WeatherCondition: String, CaseIterable {
    case sunny = "Sunny"
    case cloudy = "Cloudy"
    case rainy = "Rainy"
    case snowy = "Snowy"
}
