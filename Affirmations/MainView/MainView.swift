//
//  MainView.swift
//  Affirmations
//
//  Created by Raul Shafigin on 31.07.2024.
//

import SwiftUI
import RealmSwift

struct MainView: View {
    @StateObject private var viewModel = ViewModel()
    @ObservedResults(AffirmationObject.self) var itemGroups
    @State private var affirmations: [AffirmationObject] = []
    @State private var textValue = ""
    var body: some View {
        NavigationStack {
        VStack {
            NavigationLink(destination: SettingsView()) {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.gray)
                    .overlay {
                        Image(systemName: "gear")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
            }
            .offset(x: UIScreen.main.bounds.width / 2.5)
            
            ScrollView(.vertical, showsIndicators: false) {
                    ForEach(affirmations, id: \.self.id) { item in
                        Text("\(item.title)")
                            .padding()
                            .containerRelativeFrame(.vertical)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                .frame(alignment: .center)
            }
            .scrollTargetBehavior(.paging)
            .safeAreaPadding(.vertical)
            Spacer()
        }
        .background(Image(viewModel.background)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .opacity(0.8))
        .onAppear {
            guard let settings = StorageManager.shared.settings else { return }
            if let theme = settings.theme {
                viewModel.background = theme
            }
            guard let categories = settings.categories else { return }
            self.affirmations = viewModel.getAffirmations(with: Category(rawValue: categories) ?? .friendship)
            }
        }
    }
}

#Preview {
    MainView()
}

