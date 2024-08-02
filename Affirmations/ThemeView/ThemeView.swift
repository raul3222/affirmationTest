//
//  ChooseBackground.swift
//  Affirmations
//
//  Created by Raul Shafigin on 31.07.2024.
//

import SwiftUI

struct ThemeView: View {
    @EnvironmentObject var appRootManager: AppRootManager
    @Environment(\.dismiss) var dismiss
    @State private var selectedTheme: Theme?
    @State private var isSubmitAvailable = false
    @State private var viewModel = ViewModel()
    private var threeColumnGrid = [GridItem(.flexible())]
    
    var body: some View {
            VStack {
                TitleText(title: "Select a theme")
                SubtitleText(title: "You can change the background at any time in the settings")
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                     LazyHGrid(rows: threeColumnGrid) {
                         ForEach(viewModel.getThemes(), id: \.id) { item in
                             Image(item.background)
                                 .resizable()
                                 .frame(width: 160, height: 280)
                                 .clipShape(.rect(cornerRadius: 24))
                                 .padding()
                                 .onTapGesture {
                                     selectedTheme = Theme(rawValue: item.background)
                                 }
                         }
                     }
                     .frame(height: 300)
                 }
                
                Spacer()
                Button {
                    viewModel.selectedTheme = selectedTheme
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
                (Image(selectedTheme?.rawValue ?? "") )
                .resizable()
                .ignoresSafeArea()
                .opacity(0.5)
           )
            .onAppear(perform: {
                guard let settings = viewModel.getSettings(),
                      let theme = settings.theme else { 
                    selectedTheme = .blue
                    return }
                selectedTheme = Theme(rawValue: theme)
            })
    }
}

#Preview {
    ThemeView()
}


