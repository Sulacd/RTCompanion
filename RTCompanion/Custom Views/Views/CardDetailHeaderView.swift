//
//  CardDetailHeaderView.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/16/22.
//

import UIKit

class CardDetailHeaderView: UIView {

    let cardImage = RCImageView(frame: .zero)
    let cardTitle = RCTitleLabel(textAlignment: .left, fontSize: 34, weight: .bold)
    let manaSymbol = UIImageView()
    let manaLabel = RCSecondaryLabel(fontSize: 18)
    let regionIcon = RCImageView(frame: .zero)
    let regionLabel = RCSecondaryLabel(fontSize: 18)
    
    var region = Regions()
    var card: Card!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(card: Card) {
        self.init(frame: .zero)
        self.card = card
        configureUIElements()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUIElements() {
        translatesAutoresizingMaskIntoConstraints = false
        
        cardTitle.text = card.name
        manaSymbol.image = SFSymbols.filledVial?.withTintColor(.systemCyan)
        manaLabel.text = card.manaCost + " mana"
        regionLabel.text = card.region
        regionIcon.image = region.regionLookUp[card.region]!
        cardImage.image = card.cardFace
    }
    
    private func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        manaSymbol.translatesAutoresizingMaskIntoConstraints = false
        
        addSubViews(cardImage, cardTitle, regionIcon, regionLabel, manaSymbol, manaLabel)
        
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            cardImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            cardImage.widthAnchor.constraint(equalToConstant: 90),
            cardImage.heightAnchor.constraint(equalToConstant: 90),
            
            cardTitle.topAnchor.constraint(equalTo: cardImage.topAnchor),
            cardTitle.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: textImagePadding),
            cardTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardTitle.heightAnchor.constraint(equalToConstant: 38),
        
            regionIcon.topAnchor.constraint(equalTo: cardTitle.bottomAnchor),
            regionIcon.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: 10),
            regionIcon.widthAnchor.constraint(equalToConstant: 25),
            regionIcon.heightAnchor.constraint(equalToConstant: 25),
            
            regionLabel.centerYAnchor.constraint(equalTo: regionIcon.centerYAnchor),
            regionLabel.leadingAnchor.constraint(equalTo: regionIcon.trailingAnchor, constant: 5),
            regionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            regionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            manaSymbol.topAnchor.constraint(equalTo: regionIcon.bottomAnchor, constant: 6),
            manaSymbol.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: textImagePadding),
            manaSymbol.heightAnchor.constraint(equalToConstant: 20),
            manaSymbol.widthAnchor.constraint(equalToConstant: 20),
            
            manaLabel.centerYAnchor.constraint(equalTo: manaSymbol.centerYAnchor),
            manaLabel.leadingAnchor.constraint(equalTo: manaSymbol.trailingAnchor, constant: 8),
            manaLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            manaLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}
