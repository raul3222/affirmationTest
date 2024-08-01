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
            OnboardingModel(id: 15, title: "Что такое аффирмации и как их правильно применять. ", subtitle: "Аффирмации можно считать одним из видов самовнушения. Призыв к их использованию базируется на убеждении, что, внушая себе определенную установку, люди могут формировать новую реальность вокруг себя", image: "onboarding1", position: 1),
            OnboardingModel(id: 16, title: "Помогут ли слова перед зеркалом стать увереннее и красивее", subtitle: "Я не исправляю проблемы. Я исправляю свое мышление. Тогда проблемы решаются сами собой. Я легко настраиваю свое мышление, прежде чем пытаться решить какую-либо проблему", image: "onboarding2", position: 0),
            OnboardingModel(id: 19, title: "Зачем нужны аффирмации", subtitle: "Помогут смягчить последствия хронического стресса, восстановить самооценку и частично улучшают когнитивные способности, могут быть эффективными при защите от негативных установок", image: "onboarding3", position: 2)]
    }
    
    static func getOnboarding() -> [OnboardingModel] {
        var onBoard = createOnboardings()
        for (index, _) in onBoard.enumerated() {
            onBoard[index].id = index // transform ids received from back, because need numeration starts from zero for pageControl
        }
        return onBoard
    }
}
