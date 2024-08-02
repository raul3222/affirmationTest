//
//  Affirmations.swift
//  Affirmations
//
//  Created by Raul Shafigin on 31.07.2024.
//

import Foundation
import RealmSwift


class AffirmationObject: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var type: String
    @Persisted var favorite: Bool = false
}

struct Affirmation: Identifiable, Hashable {
    let id: Int
    let type: Category
    let text: String
    let favorite: Bool? = nil
    
    // MARK: Mock data
    static func getAffirmations() -> [Affirmation] {
        return [
            Affirmation(id: 1, type: .love, text: String(localized: "I am worthy of love and deserve to receive love in abundance")),
            Affirmation(id: 2, type: .love, text: String(localized: "My heart is open to giving and receiving love")),
            Affirmation(id: 3, type: .love, text: String(localized: "I am surrounded by love every day and in every way")),
            Affirmation(id: 4, type: .love, text: String(localized: "I attract love and loving relationships into my life")),
            Affirmation(id: 5, type: .love, text: String(localized: "Love flows to me and through me effortlessly")),
            Affirmation(id: 6, type: .love, text: String(localized: "I radiate love and others reflect love back to me")),
            Affirmation(id: 7, type: .love, text: String(localized: "My relationships are filled with love, happiness, and respect")),
            Affirmation(id: 8, type: .love, text: String(localized: "I am grateful for the love that surrounds me")),
            Affirmation(id: 9, type: .love, text: String(localized: "Love comes to me easily and effortlessly")),
            Affirmation(id: 10, type: .love, text: String(localized: "I am a magnet for loving and fulfilling relationships")),
            Affirmation(id: 11, type: .friendship, text: String(localized: "I am surrounded by supportive and loving friends")),
            Affirmation(id: 12, type: .friendship, text: String(localized: "I attract positive and loyal friendships into my life")),
            Affirmation(id: 13, type: .friendship, text: String(localized: "My friends and I share mutual respect and trust")),
            Affirmation(id: 14, type: .friendship, text: String(localized: "I am a kind and caring friend, and I receive the same in return")),
            Affirmation(id: 15, type: .friendship, text: String(localized: "My friendships are filled with joy, laughter, and understanding")),
            Affirmation(id: 16, type: .friendship, text: String(localized: "I am grateful for the amazing friends in my life")),
            Affirmation(id: 17, type: .friendship, text: String(localized: "I nurture and cherish my friendships")),
            Affirmation(id: 18, type: .friendship, text: String(localized: "I attract friends who support and uplift me")),
            Affirmation(id: 19, type: .friendship, text: String(localized: "My friends and I grow together in love and harmony")),
            Affirmation(id: 20, type: .friendship, text: String(localized: "I am a magnet for genuine and lasting friendships")),
        ]
    }
    
    static func getAffirmations(with type: Category) -> [Affirmation] {
        let array = getAffirmations()
        
        switch type {
        case .friendship:
            return array.filter( {$0.type == .friendship})
        case .love:
            return array.filter( {$0.type == .love})
        }
    }
}
