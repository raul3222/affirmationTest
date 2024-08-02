//
//  SettingsView.swift
//  Affirmations
//
//  Created by Raul Shafigin on 31.07.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var showChild = false
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: ChooseCategoryView()) {
                    Text("Category")
                }
                
                
                NavigationLink(destination: ThemeView()) {
                    Text("Theme")
                }
                NavigationLink(destination: ChooseGender()) {
                    Text("Sex")
                }
                Button(action: {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url)
                        }
                }, label: {
                    HStack {
                        Text("Language")
                            .foregroundStyle(.btnColorBlackWhite)
                        Spacer()
                    Image(systemName: "chevron.right")
                            .imageScale(.small)
                            .foregroundStyle(.chevron)
                            .fontWeight(.semibold)
                    }
                })
            }
            .listRowSpacing(10)
        }
    }
}

#Preview {
    SettingsView()
}
