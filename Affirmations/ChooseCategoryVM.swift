//
//  ChooseCategoryVM.swift
//  Affirmations
//
//  Created by Raul Shafigin on 01.08.2024.
//

import Foundation

extension ChooseCategoryView {
    @Observable
    class ViewModel {
        var selectedCategory: Categories? 
        func updateSettings() {
            guard let category = selectedCategory else { return }
            guard var settings = StorageManager.shared.getSettings() else {
                let settings = SettingsModel(categories: category.type.rawValue)
                StorageManager.shared.saveSettings(settings)
                return
            }
            settings.categories = category.type.rawValue
            StorageManager.shared.saveSettings(settings)
        }
        
        func getSettings() -> SettingsModel? {
            return StorageManager.shared.getSettings()
        }
        
        func getCategoriesList() -> [Categories] {
            StorageManager.shared.getCategoriesList()
        }
    }
}
