//
//  ChooseSex.swift
//  Affirmations
//
//  Created by Raul Shafigin on 31.07.2024.
//

import SwiftUI

struct ChooseGender: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appRootManager: AppRootManager
    @State private var selectedGender: Gender?
    @State private var viewModel = ViewModel()
    var body: some View {
        VStack {
            TitleText(title: "Select your gender")
            Spacer()
            HStack {
                BtnView(title: "Male", selected: selectedGender == .male)
                    .onTapGesture {
                        selectedGender = .male
                    }
                BtnView(title: "Female", selected: selectedGender == .female)
                    .onTapGesture {
                        selectedGender = .female
                    }
            }
            Spacer()
            Button {
                viewModel.selectedGender = selectedGender
                viewModel.updateSettings()
                if !UserDefaults.standard.bool(forKey: "notFirstRun") {
                    appRootManager.currentRoot = .main
                    UserDefaults.standard.setValue(true, forKey: "notFirstRun")
                } else {
                    dismiss()
                }
            } label: {
                Text("Continue")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.title3)
            }
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            .background(.cyan)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.bottom, 16)
        }
        .background(Image(UserDefaults.standard.string(forKey: "style") ?? Theme.blue.rawValue)
            .resizable()
            .ignoresSafeArea()
            .opacity(0.8))
        .onAppear() {
            guard let settings = viewModel.getSettings(),
                  let gender = settings.gender else { return }
            self.selectedGender = Gender(rawValue: gender)
        }
        
    
    
    }
}

#Preview {
    ChooseGender()
}
