//
//  ChooseCategoryView.swift
//  Affirmations
//
//  Created by Raul Shafigin on 30.07.2024.
//

import SwiftUI

enum Category: String {
    case love = "love"
    case friendship = "friendship"
}

struct ChooseCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appRootManager: AppRootManager
    @State private var loveSelected = false
    @State private var friendshipSelected = false
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
                BtnView(title: "Love", selected: $loveSelected)
                    .onTapGesture {
                        loveSelected = true
                        friendshipSelected = false
                        isSubmitAvailable = true
                        UserDefaults.standard.setValue(Category.love.rawValue, forKey: "category")
                    }
                BtnView(title: "Friendship", selected: $friendshipSelected)
                    .onTapGesture {
                        loveSelected = false
                        friendshipSelected = true
                        isSubmitAvailable = true
                        UserDefaults.standard.setValue(Category.friendship.rawValue, forKey: "category")
                    }
            }
           
            Spacer()
            Button(action: {
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
            if let category = UserDefaults.standard.string(forKey: "category") {
                isSubmitAvailable = true
                switch category {
                case Category.love.rawValue:
                    loveSelected = true
                    friendshipSelected = false
                case Category.friendship.rawValue:
                    loveSelected = false
                    friendshipSelected = true
                default: break
                }
            } else {
//                UserDefaults.standard.setValue(Theme.blue.rawValue, forKey: "style")
            }
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


struct CategoryButtonsView: View {
    @Binding var selected: Bool
    let title: LocalizedStringKey
    var body: some View {
        HStack {
            BtnView(title: title, selected: $selected)
        }
    }
}
