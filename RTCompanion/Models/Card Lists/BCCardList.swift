//
//  BCCardList.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/1/22.
//

import Foundation

struct BCCardList: CardListProtocol {
    var cardList: [Card] = [
        Card(cardFace: BCCards.busterShot, name: "Buster Shot", category: .slow),
        Card(cardFace: BCCards.cosmicBinding, name: "Cosmic Binding", category: .fast),
        Card(cardFace: BCCards.dropTheBomb, name: "Drop the Bomb", category: .slow),
        Card(cardFace: BCCards.flamespitter, name: "Flamespitter", category: .burst),
        Card(cardFace: BCCards.friendship, name: "Friendshup!", category: .burst),
        Card(cardFace: BCCards.groupShot, name: "Group Shot", category: .fast),
        Card(cardFace: BCCards.minimorph, name: "Minimorph", category: .burst),
        Card(cardFace: BCCards.poisonDart, name: "PoisonDart", category: .slow),
        Card(cardFace: BCCards.pokeyStick, name: "Pokey Stick", category: .fast),
        Card(cardFace: BCCards.proximityPuffCap, name: "Proximity Puffcap", category: .slow),
        Card(cardFace: BCCards.purpleBerryShake, name: "Purpleberry Shake", category: .burst),
        Card(cardFace: BCCards.sneezyBiggledust, name: "Sneezy Biggledust!", category: .focus),
        Card(cardFace: BCCards.stressDefense, name: "Stress Defense", category: .burst),
        Card(cardFace: BCCards.transposition, name: "Transposition", category: .fast),
        Card(cardFace: BCCards.wallop, name: "Wallop", category: .fast),
        Card(cardFace: BCCards.yordlePortle, name: "Yordle Portle", category: .burst),
        Card(cardFace: BCCards.yordlesInArms, name: "Yordle in Arms", category: .slow)
    ]
}
