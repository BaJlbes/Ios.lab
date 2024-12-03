//
//  Weather.swift
//  Lab5
//
//  Created by IPZ-31 on 02.12.2024.
//

import Foundation
import SwiftUI

// Стан погоди
enum WeatherCondition: String, CaseIterable, Codable {
    case sunny = "Sunny"
    case cloudy = "Cloudy"
    case rainy = "Rainy"
    case snowy = "Snowy"
}

// Модель даних
struct Weather: Identifiable, Codable {
    let id: UUID = UUID()
    let city: String
    let temperature: Double
    let humidity: Double
    let pressure: Double
    let condition: WeatherCondition
}
