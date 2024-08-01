//
//  ThemeVM.swift
//  Affirmations
//
//  Created by Raul Shafigin on 01.08.2024.
//

import Foundation

extension ChooseBackground {
    @Observable
    class ViewModel {
        var selectedTheme: Theme?
        func updateSettings() {
            guard let theme = selectedTheme else { return }
            guard var settings = StorageManager.shared.getSettings() else {
                let settings = SettingsModel(theme: theme.rawValue)
                StorageManager.shared.saveSettings(settings)
                return
            }
            settings.theme = theme.rawValue
            StorageManager.shared.saveSettings(settings)
        }
        
        func getSettings() -> SettingsModel? {
            return StorageManager.shared.getSettings()
        }
    }
}
