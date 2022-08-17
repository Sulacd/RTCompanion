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
            BCCards.groupShot,
            BCCards.poisonDart,
            BCCards.purpleBerryShake
           ],
        
        2: [
            BCCards.dropTheBomb,
            BCCards.flameSpitter,
            BCCards.pokeyStick,
            BCCards.proximityPuffcap
           ],
        
        3: [
            BCCards.stressDefense,
            BCCards.wallop,
            BCCards.yordlePortal
        ],
        
        4 : [
            BCCards.busterShot,
            BCCards.friendShip,
            BCCards.sneezyBiggleDust,
            BCCards.transposition
        ],
        
        5: [
            BCCards.cosmicBinding,
            BCCards.yordlesInArms
        ],
        
        6: [BCCards.miniMorph]
    ]
}
