//
//  Constants.swift
//  RTCompanion
//
//  Created by Christian Diaz on 7/29/22.
//

import UIKit

enum SFSymbols {
    static let filledVial = UIImage(systemName: "cross.vial.fill")
}

enum Icons {
    static let bandleCity = UIImage(named: "icon-bandlecity")
    static let bilgeWater =  UIImage(named: "icon-bilgewater")
    static let demacia = UIImage(named: "icon-demacia")
    static let freljord = UIImage(named: "icon-freljord")
    static let ionia = UIImage(named: "icon-ionia")
    static let noxus = UIImage(named: "icon-noxus")
    static let pAndZ =  UIImage(named: "icon-piltoverzaun")
    static let sI = UIImage(named: "icon-shadowisles")
    static let shurima = UIImage(named: "icon-shurima")
    static let targon = UIImage(named: "icon-targon")
    static let runeterra = UIImage(named: "icon-runeterra")
}

enum RegionNames {
    static let bandleCity = "Bandle City"
    static let bilgeWater = "Bilge Water"
    static let demacia = "Demacia"
    static let freljord =  "Freljord"
    static let ionia = "Ionia"
    static let noxus = "Noxus"
    static let pAndZ = "Piltover & Zaun"
    static let sI = "Shadow Isles"
    static let shurima = "Shurima"
    static let targon = "Targon"
    static let runeterra = "Runeterra"
}

enum BCCardNames {
    static let busterShot = "Buster Shot"
    static let cosmicBinding = "Cosmic Binding"
    static let dropTheBomb = "Drop the Bomb"
    static let flamespitter = "Flamespitter"
    static let friendship = "Friendship!"
    static let groupShot = "Group Shot"
    static let minimorph = "Minimorph"
    static let poisonDart = "Poison Dart"
    static let pokeyStick = "Pokey Stick"
    static let proximityPuffCap = "Proximity Puffcap"
    static let purpleBerryShake = "Purpleberry Shake"
    static let sneezyBiggledust = "Sneezy Biggledust!"
    static let stressDefense = "Stress Defense"
    static let transposition = "Transposition"
    static let wallop = "Wallop"
    static let yordlePortal = "Yordle Portal"
    static let yordlesInArms = "Yordles in Arms"
}

enum BCCards {
    static let busterShot = Card(
        cardFace: UIImage(named: BCCardNames.busterShot),
        name: BCCardNames.busterShot,
        category: .slow,
        manaCost: "4",
        description: "Costs 2 less if you have a Tristana or if you've played cards from 4+ regions this game. Deal 3 to a unit.",
        region: RegionNames.bandleCity
    )
    
    static let cosmicBinding = Card(
        cardFace: UIImage(named: BCCardNames.cosmicBinding),
        name: BCCardNames.cosmicBinding,
        category: .fast,
        manaCost: "5",
        description: "Deal 2 to an enemy and Stun another. Plant 3 Chimes on random cards in your deck.",
        region: RegionNames.bandleCity
    )
    
    static let dropTheBomb = Card(
        cardFace: UIImage(named: BCCardNames.dropTheBomb),
        name: BCCardNames.dropTheBomb,
        category: .slow,
        manaCost: "2",
        description: "Deal 2 to a unit and summon a Scrappy Bomb.",
        region: RegionNames.bandleCity
    )
    
    static let flameSpitter = Card(
        cardFace: UIImage(named: BCCardNames.flamespitter),
        name: BCCardNames.flamespitter,
        category: .burst,
        manaCost: "2",
        description: "Grant an ally +2|0 and Impact.",
        region: RegionNames.bandleCity
    )
    
    static let friendShip = Card(
        cardFace: UIImage(named: BCCardNames.friendship),
        name: BCCardNames.friendship,
        category: .burst,
        manaCost: "4",
        description: "Give an ally Barrier or SpellShield this round.",
        region: RegionNames.bandleCity
    )
    
    static let groupShot = Card(
        cardFace: UIImage(named: BCCardNames.groupShot),
        name: BCCardNames.groupShot,
        category: .fast,
        manaCost: "1",
        description: "Deal 1 to a unit. If you have 4+ allies, deal 2 instead.",
        region: RegionNames.bandleCity
    )
    
    static let miniMorph = Card(
        cardFace: UIImage(named: BCCardNames.minimorph),
        name: BCCardNames.minimorph,
        category: .burst,
        manaCost: "6",
        description: "Transform a unit into a 3|3 Mini-Minitee and Silence it.",
        region: RegionNames.bandleCity
    )
    
    static let poisonDart = Card(
        cardFace: UIImage(named: BCCardNames.poisonDart),
        name: BCCardNames.poisonDart,
        category: .slow,
        manaCost: "1",
        description: "Deal 1 to anything and plant 3 Poison Puffcaps on random cards in the enemy deck.",
        region: RegionNames.bandleCity
    )
    
    static let pokeyStick = Card(
        cardFace: UIImage(named: BCCardNames.pokeyStick),
        name: BCCardNames.pokeyStick,
        category: .fast,
        manaCost: "2",
        description: "Deal 1 to anything. Draw 1.",
        region: RegionNames.bandleCity
    )
    
    static let proximityPuffcap = Card(
        cardFace: UIImage(named: BCCardNames.proximityPuffCap),
        name: BCCardNames.proximityPuffCap,
        category: .slow,
        manaCost: "2",
        description: "Deal 1 to a unit. If one of your traps or boons activated this round, deal 3 to it instead.",
        region: RegionNames.bandleCity
    )
    
    static let purpleBerryShake = Card(
        cardFace: UIImage(named: BCCardNames.purpleBerryShake),
        name: BCCardNames.purpleBerryShake,
        category: .burst,
        manaCost: "1",
        description: "Grow an ally to 3|3 this round.",
        region: RegionNames.bandleCity
    )
    
    static let sneezyBiggleDust = Card(
        cardFace: UIImage(named: BCCardNames.sneezyBiggledust),
        name: BCCardNames.sneezyBiggledust,
        category: .focus,
        manaCost: "4",
        description: "Give allies +1|+1 this round. If they're created, give them +2|+2 instead.",
        region: RegionNames.bandleCity
    )
    
    static let stressDefense = Card(
        cardFace: UIImage(named: BCCardNames.stressDefense),
        name: BCCardNames.stressDefense,
        category: .burst,
        manaCost: "3",
        description: "Set a unit's stats to 1|6 this round.",
        region: RegionNames.bandleCity
    )
    
    static let transposition = Card(
        cardFace: UIImage(named: BCCardNames.transposition),
        name: BCCardNames.transposition,
        category: .fast,
        manaCost: "4",
        description: "Recall an ally. The next ally you play this round with equal or less cost, costs 0 instead.",
        region: RegionNames.bandleCity
    )
    
    static let wallop = Card(
        cardFace: UIImage(named: BCCardNames.wallop),
        name: BCCardNames.wallop,
        category: .fast,
        manaCost: "3",
        description: "Deal 1 to an enemy and Stun it.",
        region: RegionNames.bandleCity
    )
    
    static let yordlePortal = Card(
        cardFace: UIImage(named: BCCardNames.yordlePortal),
        name: BCCardNames.yordlePortal,
        category: .burst,
        manaCost: "3",
        description: "To play, discard 1. Manifest a Yordle that costs 3 or less and summon it.",
        region: RegionNames.bandleCity
    )
    
    static let yordlesInArms = Card(
        cardFace: UIImage(named: BCCardNames.yordlesInArms),
        name: BCCardNames.yordlesInArms,
        category: .slow,
        manaCost: "5",
        description: "Give allies +2|+2 this round. If you've played cards from 4+ regions, give allies +3|+3 instead.",
        region: RegionNames.bandleCity
    )
}


