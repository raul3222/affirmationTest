//
//  MainView.swift
//  Affirmations
//
//  Created by Raul Shafigin on 31.07.2024.
//

import SwiftUI

struct MainView: View {
    @State private var affirmations = Affirmation.getAffirmations(with: .love)
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
                            .foregroundColor(.black)
                            .frame(width: 24, height: 24)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                
            }
            .offset(x: UIScreen.main.bounds.width / 3)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(affirmations, id: \.self.id) { item in
                        Text("\(item.text)")
                            .padding()
                            .containerRelativeFrame(.vertical)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                    }
                }
                .frame(alignment: .center)
            }
            .scrollTargetBehavior(.paging)
            .safeAreaPadding(.vertical)
            
            
            Spacer()
            
        }
        .background(Image(UserDefaults.standard.string(forKey: "style") ?? Theme.blue.rawValue)
            .resizable()
            .ignoresSafeArea()
            .opacity(0.8))
        .onAppear {
            if let type = UserDefaults.standard.string(forKey: "category"),
               let enumType = Category(rawValue: type){
                
                self.affirmations = Affirmation.getAffirmations(with: enumType)
            }
            
        }
    }
    }
}

#Preview {
    MainView()
}

