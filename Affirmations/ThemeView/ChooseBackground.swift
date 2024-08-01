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
    @State private var redSelected = false
    @State private var blueSelected = true
    @State private var isSubmitAvailable = false
    @State private var viewModel = ViewModel()
    
    var body: some View {
            VStack {
                Text("Select a theme")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding()
                Text("You can change the background at any time in the settings")
                    .font(.title3)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                
                HStack {
                    BtnView(title: "Red", selected: $redSelected)
                        .onTapGesture {
                            withAnimation {
                                redSelected = true
                                blueSelected = false
                            }
                            UserDefaults.standard.setValue(Theme.red.rawValue, forKey: "style")
                           
                        }
                    BtnView(title: "Blue", selected: $blueSelected)
                        .onTapGesture {
                            withAnimation {
                                redSelected = false
                                blueSelected = true
                            }
                            UserDefaults.standard.setValue(Theme.blue.rawValue, forKey: "style")
                        }
                }
                Spacer()
                Button {
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
                (redSelected ? Image(Theme.red.rawValue) : Image(Theme.blue.rawValue))
                .resizable()
                .ignoresSafeArea()
                .opacity(0.8)
           )
            .onAppear(perform: {
                if let style = UserDefaults.standard.string(forKey: "style") {
                    switch style {
                    case Theme.blue.rawValue:
                        blueSelected = true
                        redSelected = false
                    case Theme.red.rawValue:
                        blueSelected = false
                        redSelected = true
                    default: break
                    }
                } else {
                    UserDefaults.standard.setValue(Theme.blue.rawValue, forKey: "style")
                }
            })
        
       
      
        
        
    }
}

#Preview {
    ChooseBackground()
}

