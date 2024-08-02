//
//  MainVM.swift
//  Affirmations
//
//  Created by Raul Shafigin on 01.08.2024.
//

import Foundation
import RealmSwift


extension MainView {
    @Observable
    class ViewModel: ObservableObject {
        var affirmations: Results<AffirmationObject>?

        let realm = try! Realm()
        
        func getSettings() -> SettingsModel? {
            return StorageManager.shared.getSettings()
        }
        
        func getCategoriesList() -> [Categories] {
            StorageManager.shared.getCategoriesList()
        }
        
        func getAffirmations(with type: Category) -> [AffirmationObject] {
            guard let affirmations = StorageManager.shared.fetchAffirmationsFromLocalDB() else { return [] }
            return Array(affirmations).filter({$0.type == type.rawValue})
            
        }
    }
}
