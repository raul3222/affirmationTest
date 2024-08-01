//
//  GenderVM.swift
//  Affirmations
//
//  Created by Raul Shafigin on 01.08.2024.
//

import Foundation

extension ChooseGender {
    @Observable
    class ViewModel {
        var selectedGender: Gender?
        func updateSettings() {
            guard let gender = selectedGender else { return }
            guard var settings = StorageManager.shared.getSettings() else {
                let settings = SettingsModel(gender: gender.rawValue)
                StorageManager.shared.saveSettings(settings)
                return
            }
            settings.gender = gender.rawValue
            StorageManager.shared.saveSettings(settings)
        }
        
        func getSettings() -> SettingsModel? {
            return StorageManager.shared.getSettings()
        }
    }
}
