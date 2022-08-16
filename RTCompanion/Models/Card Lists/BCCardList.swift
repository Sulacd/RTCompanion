//
//  BCCardList.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/1/22.
//

import Foundation

struct BCCardList: CardListProtocol {
    
    var cardListByMana: [Int : [Card]] = [
        1: [
            Card(cardFace: BCCards.groupShot, name: "Group Shot", category: .fast),
            Card(cardFace: BCCards.poisonDart, name: "Poison Dart", category: .slow),
            Card(cardFace: BCCards.purpleBerryShake, name: "Purpleberry Shake", category: .burst)
           ],
        
        2: [
            Card(cardFace: BCCards.dropTheBomb, name: "Drop the Bomb", category: .slow),
            Card(cardFace: BCCards.flamespitter, name: "Flamespitter", category: .burst),
            Card(cardFace: BCCards.pokeyStick, name: "Pokey Stick", category: .fast),
            Card(cardFace: BCCards.proximityPuffCap, name: "Proximity Puffcap", category: .slow)
           ],
        
        3: [
            Card(cardFace: BCCards.stressDefense, name: "Stress Defense", category: .burst),
            Card(cardFace: BCCards.wallop, name: "Wallop", category: .fast),
            Card(cardFace: BCCards.yordlePortle, name: "Yordle Portal", category: .burst)
        ],
        
        4 : [
            Card(cardFace: BCCards.busterShot, name: "Buster Shot", category: .slow),
            Card(cardFace: BCCards.friendship, name: "Friendship!", category: .burst),
            Card(cardFace: BCCards.sneezyBiggledust, name: "Sneezy Biggledust!", category: .focus),
            Card(cardFace: BCCards.transposition, name: "Transposition", category: .fast)
        ],
        
        5: [
            Card(cardFace: BCCards.cosmicBinding, name: "Cosmic Binding", category: .fast),
            Card(cardFace: BCCards.yordlesInArms, name: "Yordles in Arms", category: .slow)
        ],
        
        6: [Card(cardFace: BCCards.minimorph, name: "Minimorph", category: .burst)]
    ]
}
