//
//  AppRootManage.swift
//  Affirmations
//
//  Created by Raul Shafigin on 30.07.2024.
//

import Foundation


final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .splash
    
    init() {
        checkFirstRun()
    }
    
    enum eAppRoots {
        case splash
        case settings
        case category
        case color
        case sex
        case main
    }
    
    private func checkFirstRun() {
        if UserDefaults.standard.bool(forKey: "notFirstRun") {
            currentRoot = .main
        } else {
            currentRoot = .splash
        }
    }
}
