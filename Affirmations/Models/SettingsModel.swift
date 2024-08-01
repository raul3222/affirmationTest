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

struct ThemeModel {
    let id: Int
    let background: String
}

enum Category: String {
    case love = "Love"
    case friendship = "Friendship"
    
    func localizedString() -> String {
            return NSLocalizedString(self.rawValue, comment: "")
    }
        
    static func getTitleFor(_ title: Category) -> String {
            return title.localizedString()
    }
}

struct Categories {
    let id: Int
    let type: Category
}

struct SettingsModel: Codable {
    var gender: String?
    var categories: String?
    var theme: String?
}
