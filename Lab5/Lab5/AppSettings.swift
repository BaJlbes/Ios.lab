//
//  AppSettings.swift
//  Lab5
//
//  Created by IPZ-31 on 02.12.2024.
//

import SwiftUI

struct AppSettings: Codable {
    var fontColor: ColorSetting
    var backgroundColor: ColorSetting
    var fontSize: CGFloat
    
    static let `default` = AppSettings(
        fontColor: .black,
        backgroundColor: .white,
        fontSize: 16
    )
}

enum ColorSetting: String, Codable, CaseIterable {
    case white, black, blue, green, yellow, red
    
    var color: Color {
        switch self {
        case .white: return .white
        case .black: return .black
        case .blue: return .blue
        case .green: return .green
        case .yellow: return .yellow
        case .red: return .red
        }
    }
}
