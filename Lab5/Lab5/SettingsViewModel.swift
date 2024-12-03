//
//  SettingsViewModel.swift
//  Lab5
//
//  Created by IPZ-31 on 02.12.2024.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var settings: AppSettings {
        didSet {
            saveSettings()
        }
    }
    
    init() {
        self.settings = SettingsViewModel.loadSettings()
    }
    
    private static func loadSettings() -> AppSettings {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: "AppSettings"),
           let decoded = try? JSONDecoder().decode(AppSettings.self, from: data) {
            return decoded
        }
        return AppSettings.default
    }
    
    private func saveSettings() {
        let defaults = UserDefaults.standard
        if let data = try? JSONEncoder().encode(settings) {
            defaults.set(data, forKey: "AppSettings")
        }
    }
}
