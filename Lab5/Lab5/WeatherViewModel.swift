//
//  WeatherViewModel.swift
//  Lab5
//
//  Created by IPZ-31 on 02.12.2024.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: [Weather] = [] // Усі погодні дані
    @Published var filteredWeatherData: [Weather] = [] // Відфільтровані дані
    
    private var fileURL: URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent("weatherData.json")
    }
    
    init() {
        loadWeatherData()
    }
    
    // Завантаження тестових даних
    func loadMockData() {
        let mockData = [
            Weather(city: "New York", temperature: 22.5, humidity: 60, pressure: 1012, condition: .sunny),
            Weather(city: "London", temperature: 18.0, humidity: 80, pressure: 1008, condition: .cloudy),
            Weather(city: "Tokyo", temperature: 25.0, humidity: 70, pressure: 1010, condition: .rainy)
        ]
        self.weatherData = mockData
        self.filteredWeatherData = mockData
    }
    
    // Фільтрація за містом і станом
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
    
    // Збереження даних у файл
    func saveWeatherData() {
        do {
            let data = try JSONEncoder().encode(weatherData)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save weather data: \(error)")
        }
    }
    
    // Завантаження даних із файлу
    func loadWeatherData() {
        do {
            let data = try Data(contentsOf: fileURL)
            let decodedData = try JSONDecoder().decode([Weather].self, from: data)
            self.weatherData = decodedData
            self.filteredWeatherData = decodedData
        } catch {
            print("Failed to load weather data: \(error)")
            loadMockData() // Завантаження тестових даних, якщо немає збережених
        }
    }
}
