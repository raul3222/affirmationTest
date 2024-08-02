//
//  StorageManager.swift
//  Affirmations
//
//  Created by Raul Shafigin on 01.08.2024.
//

import Foundation

class StorageManager {
    private init() {
        guard let settings = getSettings() else { return }
        self.settings = settings
    }
    var settings: SettingsModel?
    static let shared = StorageManager()
    
    
    func getThemes() -> [ThemeModel] {
        return [
            ThemeModel(id: 1, background: "redStyle"),
            ThemeModel(id: 2, background: "blueStyle")]
    }
    
    func getCategoriesList() -> [Categories] {
        return [
            Categories(id: 1, type: .love),
            Categories(id: 2, type: .friendship)]
    }
    
    func getSettings() -> SettingsModel? {
        let userDefaults = UserDefaults.standard
        do {
            let settings = try userDefaults.getObject(forKey: "settings", castTo: SettingsModel.self)
            self.settings = settings
            return settings
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func saveSettings(_ settings: SettingsModel) {
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(settings, forKey: "settings")
            self.settings = settings
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
