//
//  Onboarding.swift
//  Affirmations
//
//  Created by Raul Shafigin on 31.07.2024.
//

import Foundation

struct OnboardingModel: Codable {
    var id: Int = 0
    let title: String
    let subtitle: String
    let image: String
    let position: Int
    
    enum CodingKeys: String, CodingKey {
        case title, subtitle, image, position
    }
    
    static func createOnboardings() -> [OnboardingModel] { // received object from backend
        return [
            OnboardingModel(id: 15, title: String(localized: "What are affirmations and how to use them correctly."), subtitle: String(localized: "Affirmations can be considered a type of self-hypnosis. The call for their use is based on the belief that by instilling in themselves a certain attitude, people can form a new reality around themselves."), image: "onboarding1", position: 1),
            OnboardingModel(id: 16, title: String(localized: "Will speaking in front of a mirror help you become more confident and beautiful?"), subtitle: String(localized: "I don't fix problems. I correct my thinking. Then problems solve themselves. I easily adjust my thinking before trying to solve any problem."), image: "onboarding2", position: 0),
            OnboardingModel(id: 19, title: String(localized: "Why are affirmations needed"), subtitle: String(localized: "They will help mitigate the effects of chronic stress, restore self-esteem and partially improve cognitive abilities, and may be effective in protecting against negative attitudes."), image: "onboarding3", position: 2)]
    }

}
