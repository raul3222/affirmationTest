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
            Text("Choose category")
                .padding(.top, 32)
                .font(.title)
            Text("We will select affirmations based on the selected category")
                .multilineTextAlignment(.center)
                .padding(16)
            Spacer()
            HStack {
                ForEach(viewModel.getCategoriesList(), id: \.id) { cat in
                    BtnView1(title: Category.getTitleFor(cat.type), selected: selectedCategory == cat.type)
                        .onTapGesture {
                            selectedCategory = cat.type
                            viewModel.selectedCategory = cat
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
            Image("onboarding2")
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


struct BtnView: View {
    let title: LocalizedStringKey
    @Binding var selected: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .frame(width: UIScreen.main.bounds.width / 2.4, height: 48)
                .foregroundStyle(selected ? .cyan : .gray)
                .padding()
            Text(title)
                .foregroundStyle(.white)
                .font(.title3)
        }
    }
}

struct BtnView1: View {
    let title: String
    let selected: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .frame(width: UIScreen.main.bounds.width / 2.4, height: 48)
                .foregroundStyle(selected ? .cyan : .gray)
                .padding()
            Text(title)
                .foregroundStyle(.white)
                .font(.title3)
        }
    }
}


struct CategoryButtonsView: View {
    @Binding var selected: Bool
    let title: LocalizedStringKey
    var body: some View {
        HStack {
            BtnView(title: title, selected: $selected)
        }
    }
}
