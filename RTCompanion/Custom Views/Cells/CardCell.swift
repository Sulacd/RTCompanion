//
//  CardCell.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/3/22.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    static let reuseId = "CardCell"
    
    let cardImageView = RCImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.backgroundColor = .secondarySystemGroupedBackground

        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        contentView.addSubViews(cardImageView)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            cardImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            cardImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cardImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            cardImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }
    
}
