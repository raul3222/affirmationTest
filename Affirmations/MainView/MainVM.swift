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
        
        var afar: [AffirmationObject]?
        let realm = try! Realm()
        var background: String = ""
        
        func getSettings() -> SettingsModel? {
            return StorageManager.shared.getSettings()
        }
        
        func getCategoriesList() -> [Categories] {
            StorageManager.shared.getCategoriesList()
        }
        
        func getAffirmations(with type: Category) -> [AffirmationObject] {
            guard let affirmations = StorageManager.shared.fetchAffirmationsFromLocalDB() else { return [] }
            let af = Array(affirmations).filter({$0.type == type.rawValue})
            self.afar = af
            return af
        }
    }
}
