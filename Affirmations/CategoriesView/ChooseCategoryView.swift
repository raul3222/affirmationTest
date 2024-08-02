//
//  ChooseCategoryView.swift
//  Affirmations
//
//  Created by Raul Shafigin on 30.07.2024.
//

import SwiftUI



struct ChooseCategoryView: View {
    @State private var viewModel = ViewModel()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appRootManager: AppRootManager
    @State private var selectedCategory: Category?
    @State private var isSubmitAvailable = false
    @State private var index = 0
    var body: some View {
        VStack {
            TitleText(title: "Choose category")
           SubtitleText(title: "We will select affirmations based on the selected category")
            Spacer()
            HStack {
                ForEach(viewModel.getCategoriesList(), id: \.id) { cat in
                    BtnView(title: Category.getTitleFor(cat.type), selected: selectedCategory == cat.type)
                        .onTapGesture {
                            selectedCategory = cat.type
                            viewModel.selectedCategory = cat
                            isSubmitAvailable = true
                        }
                }
            }
            Spacer()
            Button(action: {
                viewModel.updateSettings()
                if  !UserDefaults.standard.bool(forKey: "notFirstRun") {
                    appRootManager.currentRoot = .color
                } else {
                    dismiss()
                }
            }, label: {
                Text("Continue")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            })
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            .background(isSubmitAvailable ? .cyan : .gray)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.bottom, 16)
            .disabled(!isSubmitAvailable)
                   
        }
        .background(
            Image(StorageManager.shared.settings?.theme ?? "onboarding2")
                .resizable()
                .ignoresSafeArea()
        )
        .onAppear() {
            guard let settings = viewModel.getSettings(),
                  let categories = settings.categories else { return }
            isSubmitAvailable = true
            selectedCategory = Category(rawValue: categories)
        }
    }
}

#Preview {
    ChooseCategoryView()
}
