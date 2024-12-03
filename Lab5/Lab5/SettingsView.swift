//
//  SettingsView.swift
//  Lab5
//
//  Created by IPZ-31 on 02.12.2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        Form {
            Section(header: Text("Font Color")) {
                Picker("Font Color", selection: $viewModel.settings.fontColor) {
                    ForEach(ColorSetting.allCases, id: \.self) { color in
                        Text(color.rawValue.capitalized).tag(color)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Background Color")) {
                Picker("Background Color", selection: $viewModel.settings.backgroundColor) {
                    ForEach(ColorSetting.allCases, id: \.self) { color in
                        Text(color.rawValue.capitalized).tag(color)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Font Size")) {
                Stepper(value: $viewModel.settings.fontSize, in: 10...30, step: 1) {
                    Text("Font Size: \(viewModel.settings.fontSize, specifier: "%.0f")")
                }
            }
        }
        .navigationTitle("Settings")
    }
}
