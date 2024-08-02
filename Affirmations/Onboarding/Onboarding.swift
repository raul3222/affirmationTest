//
//  Onboarding.swift
//  Affirmations
//
//  Created by Raul Shafigin on 30.07.2024.
//

import SwiftUI

struct Onboarding: View {
    @EnvironmentObject var appRootManager: AppRootManager
    @State public var tabViewSelection = 0
    @State private var onboardings = OnboardingModel.getOnboarding().sorted(by:{ $0.position < $1.position})
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $tabViewSelection) {
                ForEach(onboardings, id: \.self.position) 
                { onboarding in
                    OnboardingView(title: onboarding.title, subtitle: onboarding.subtitle, img: onboarding.image)
                }
            }
            .ignoresSafeArea()
            .tabViewStyle(.page)
            PageView(tabViewSelection: tabViewSelection, array: onboardings)
                .animation(.default)
            .padding(.bottom, 350)
            HStack() {
                Spacer()
                Button(action: {
                    if tabViewSelection < onboardings.count - 1 {
                        withAnimation {
                            tabViewSelection += 1
                        }
                    } else {
                            appRootManager.currentRoot = .category
                    }
                }, label: {
                    RoundedRectangle(cornerRadius: 24)
                    .frame(width: 48, height: 48)
                    .foregroundStyle(.cyan)
                    .clipShape(Circle())
                    .overlay(Image(systemName: "chevron.right")
                        .foregroundStyle(.white))
                    .padding(.trailing, 22)
                })
            }
        }
    }
        
       
}

#Preview {
    Onboarding()
}

struct OnboardingView: View {
    let title: String
    let subtitle: String
    let img: String
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(img)
                .resizable()
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(height: 420, alignment: .bottom)
                .clipShape(
                    .rect(
                        topLeadingRadius: 60,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 0
                    )
                )
                .overlay(
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.custom("GolosText-Regular_Semibold", size: 30))
                            .padding(.leading, 30)
                            
                        Text(subtitle)
                            .font(.custom("GolosText-Regular", size: 15))
                            .lineSpacing(6)
                            .padding(.leading, 30)
                            .padding(.trailing, 30)
                            .padding(.top, 1)
                        Spacer()
                    }
                        .padding(.top, 67)
                )
        }
        .ignoresSafeArea()

    }
}

struct PageView: View {
    let tabViewSelection: Int
    let array: [OnboardingModel]
    var body: some View {
        HStack {
            ForEach(array, id: \.id) { item in
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: tabViewSelection == item.position ? 27 : 10, height: 10)
                    .foregroundStyle(tabViewSelection == item.position ? .cyan : .gray)
            }
        }
    }
}
