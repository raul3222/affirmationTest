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
            PageView(tabViewSelection: tabViewSelection)
            .padding(.bottom, 350)
            HStack() {
                Spacer()
                Button("") {
                    print("tap")
                }
                
                .frame(width: 48, height: 48)
                .background(.cyan)
                .clipShape(Circle())
                .overlay(Image(systemName: "chevron.right"))
               
                .foregroundStyle(.white)
                .onTapGesture {
                        if tabViewSelection != 2 {
                            withAnimation {
                                tabViewSelection += 1
                            }
                        } else {
                                appRootManager.currentRoot = .category
                          
                        }
                   
                }
                .padding(.trailing, 22)
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
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: tabViewSelection == 0 ? 27 : 10, height: 10)
                .foregroundStyle(tabViewSelection == 0 ? .cyan : .gray)
            RoundedRectangle(cornerRadius: 5)
                .frame(width: tabViewSelection == 1 ? 27 : 10, height: 10)
                .foregroundStyle(tabViewSelection == 1 ? .cyan: .gray)
            RoundedRectangle(cornerRadius: 5)
                .frame(width: tabViewSelection == 2 ? 27 : 10, height: 10)
                .foregroundStyle(tabViewSelection == 2 ? .cyan : .gray)

        }
    }
}
