//
//  ContentView.swift
//  Lab5
//
//  Created by IPZ-31 on 02.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var weatherViewModel = WeatherViewModel()
    @StateObject private var settingsViewModel = SettingsViewModel()
    @State private var showSettings = false
    @State private var filterCity: String = ""
    @State private var selectedCondition: WeatherCondition? = nil

    var body: some View {
        NavigationView {
            ZStack {
                // Застосовуємо вибраний фон
                settingsViewModel.settings.backgroundColor.color
                    .ignoresSafeArea()
                
                VStack {
                    // Фільтри
                    HStack {
                        TextField("Фільтр за містом", text: $filterCity)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .foregroundColor(settingsViewModel.settings.fontColor.color)

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
                    List(weatherViewModel.filteredWeatherData) { weather in
                        VStack(alignment: .leading) {
                            Text(weather.city).font(.headline)
                            Text("Температура: \(weather.temperature, specifier: "%.1f")°C")
                            Text("Вологість: \(weather.humidity, specifier: "%.0f")%")
                            Text("Тиск: \(weather.pressure, specifier: "%.0f") hPa")
                            Text("Стан: \(weather.condition.rawValue)")
                        }
                        .font(.system(size: settingsViewModel.settings.fontSize))
                        .foregroundColor(settingsViewModel.settings.fontColor.color)
                    }
                    .scrollContentBackground(.hidden) // Прибираємо фон List
                    .background(settingsViewModel.settings.backgroundColor.color)

                    // Кнопка оновлення
                    Button("Оновити дані") {
                        weatherViewModel.loadMockData()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .navigationTitle("Погода")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showSettings.toggle()
                    }) {
                        Image(systemName: "gear")
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView(viewModel: settingsViewModel)
            }
            .onChange(of: filterCity) { newValue in
                weatherViewModel.filterWeather(byCity: newValue, byCondition: selectedCondition)
            }
            .onChange(of: selectedCondition) { newValue in
                weatherViewModel.filterWeather(byCity: filterCity, byCondition: newValue)
            }
        }
    }
}
#Preview {
    ContentView()
}
