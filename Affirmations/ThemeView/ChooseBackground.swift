//
//  ChooseBackground.swift
//  Affirmations
//
//  Created by Raul Shafigin on 31.07.2024.
//

import SwiftUI

struct ChooseBackground: View {
    @EnvironmentObject var appRootManager: AppRootManager
    @Environment(\.dismiss) var dismiss
    @State private var selectedTheme: Theme?
    @State private var isSubmitAvailable = false
    @State private var viewModel = ViewModel()
    
    var body: some View {
            VStack {
                TitleText(title: "Select a theme")
                SubtitleText(title: "You can change the background at any time in the settings")
                Spacer()
                
                HStack {
                    
                    ForEach(viewModel.getThemes(), id: \.id) { theme in
                        BtnView(title: theme.background, selected: selectedTheme?.rawValue == theme.background)
                            .onTapGesture {
                                selectedTheme = Theme(rawValue: theme.background)
                                viewModel.selectedTheme = selectedTheme
                            }
                    }
                }
                Spacer()
                Button {
                    viewModel.updateSettings()
                    if  !UserDefaults.standard.bool(forKey: "notFirstRun") {
                        appRootManager.currentRoot = .sex
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
            .background(
                (Image(selectedTheme?.rawValue ?? "blueStyle") )
                .resizable()
                .ignoresSafeArea()
                .opacity(0.8)
           )
            .onAppear(perform: {
                guard let settings = viewModel.getSettings(),
                      let theme = settings.theme else { return }
                selectedTheme = Theme(rawValue: theme)
            })
        
       
      
        
        
    }
}

#Preview {
    ChooseBackground()
}


