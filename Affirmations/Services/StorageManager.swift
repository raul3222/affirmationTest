//
//  StorageManager.swift
//  Affirmations
//
//  Created by Raul Shafigin on 01.08.2024.
//

import Foundation
import RealmSwift

class StorageManager {
    let realm = try! Realm()
    var settings: SettingsModel?
    static let shared = StorageManager()
    
    private init() {
        fetchAffirmations()
        guard let settings = getSettings() else { return }
        self.settings = settings
    }
    
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
    
    private func saveAffirmationsToDB(_ affirmations: [Affirmation]) {
        deleteObjects()
        for item in affirmations {
            addAffirm(title: item.text, type: item.type.rawValue)
        }
        
    }
    
    func addAffirm(title: String, type: String) {
        let afirmObj = AffirmationObject(value: [
            "title": title,
            "type": type,
            "favorite": false
        ])
        do {
            try realm.write {
                realm.add(afirmObj)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func fetchAffirmationsFromLocalDB() -> Results<AffirmationObject>? {
        do {
            let realm = try Realm()
            return realm.objects(AffirmationObject.self)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func fetchAffirmations() {
        let affirmations = Affirmation.getAffirmations()
        saveAffirmationsToDB(affirmations)
    }
    
    private func deleteObjects() {
       let localObjects = realm.objects(AffirmationObject.self)
        do {
            try realm.write {
                realm.delete(localObjects)
            }
        } catch {
            print("deleting error")
        }
    }
}
