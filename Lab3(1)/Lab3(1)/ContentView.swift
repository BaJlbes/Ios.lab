//
//  ContentView.swift
//  Lab3(1)
//
//  Created by IPZ-31 on 02.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var filterCity: String = ""
    @State private var selectedCondition: WeatherCondition? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                // Фільтри
                HStack {
                    TextField("Фільтр за містом", text: $filterCity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Picker("Стан", selection: $selectedCondition) {
                        Text("Усі").tag(WeatherCondition?.none)
                        ForEach(WeatherCondition.allCases, id: \.self) { condition in
                            Text(condition.rawValue).tag(condition as WeatherCondition?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                }
                
                // Список погоди
                List(viewModel.filteredWeatherData) { weather in
                    VStack(alignment: .leading) {
                        Text(weather.city).font(.headline)
                        Text("Температура: \(weather.temperature, specifier: "%.1f")°C")
                        Text("Вологість: \(weather.humidity, specifier: "%.0f")%")
                        Text("Тиск: \(weather.pressure, specifier: "%.0f") hPa")
                        Text("Стан: \(weather.condition.rawValue)")
                    }
                    
                    
                    // Кнопка оновлення
                    Button("Оновити дані") {
                        viewModel.loadMockData()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .navigationTitle("Погода")
                .onChange(of: filterCity) { newValue in
                    viewModel.filterWeather(byCity: newValue, byCondition: selectedCondition)
                }
                .onChange(of: selectedCondition) { newValue in
                    viewModel.filterWeather(byCity: filterCity, byCondition: newValue)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
