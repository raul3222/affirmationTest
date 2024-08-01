//
//  MainVM.swift
//  Affirmations
//
//  Created by Raul Shafigin on 01.08.2024.
//

import Foundation

extension MainView {
    @Observable
    class ViewModel {
        var background: String = ""
        func getSettings() -> SettingsModel? {
            return StorageManager.shared.getSettings()
        }
        
        func getCategoriesList() -> [Categories] {
            StorageManager.shared.getCategoriesList()
        }
    }
}
