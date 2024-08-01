//
//  SettingsModel.swift
//  Affirmations
//
//  Created by Raul Shafigin on 31.07.2024.
//

import Foundation

enum Theme: String {
    case red = "redStyle"
    case blue = "blueStyle"
}

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

struct SettingsModel {
    let gender: Gender?
    let categories: [Category]?
    let theme: Theme?
}
