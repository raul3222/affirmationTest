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
    @State private var maleSelected = false
    @State private var femaleSelected = false
    var body: some View {
        VStack {
            Text("Select your gender")
                .padding(.top, 32)
                .font(.title)
            Spacer()
            HStack {
                BtnView(title: "Male", selected: $maleSelected)
                    .onTapGesture {
                        maleSelected = true
                        femaleSelected = false
                    }
                BtnView(title: "Female", selected: $femaleSelected)
                    .onTapGesture {
                        maleSelected = false
                        femaleSelected = true
                    }
            }
            Spacer()
            Button {
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
        
    
    
    }
}

#Preview {
    ChooseGender()
}
