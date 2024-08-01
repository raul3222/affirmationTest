//
//  HelpersViews.swift
//  Affirmations
//
//  Created by Raul Shafigin on 01.08.2024.
//

import Foundation
import SwiftUI


struct TitleText: View {
    let title: String
    var body: some View {
        Text(NSLocalizedString(title, comment: ""))
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.black)
            .padding()
    }
}

struct SubtitleText: View {
    let title: String
    var body: some View {
        Text(NSLocalizedString(title, comment: ""))
            .font(.title3)
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct BtnView: View {
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
