//
//  AffirmationsApp.swift
//  Affirmations
//
//  Created by Raul Shafigin on 30.07.2024.
//

import SwiftUI

@main
struct AffirmationsApp: App {
    @StateObject private var appRootManager = AppRootManager()
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    Onboarding()
                    
                case .settings:
                    SettingsView()
                        .transition(.slide.animation(.easeInOut(duration: 1.0)))
//                        .transition(.scale.animation(.easeInOut(duration: 0.5)))
                case .category:
                    ChooseCategoryView()
                        .transition(.scale.animation(.easeInOut(duration: 0.5)))
                case .color:
                    ChooseBackground()
                        .transition(.move(edge: .bottom).animation(.easeInOut(duration: 1.0)))
                case .sex:
                    ChooseGender()
                        .transition(.opacity.animation(.easeInOut(duration: 1.0)))
                case .main:
                    MainView()
                        
                }
            }
            .environmentObject(appRootManager)
        }
    }
}
