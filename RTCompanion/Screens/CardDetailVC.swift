//
//  CardDetailVC.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/14/22.
//

import UIKit

class CardDetailVC: UIViewController {
    
    var selectedCard: Card
    lazy var cardDetailHeaderView = CardDetailHeaderView(card: selectedCard)
    let cardDescriptionLabel = RCBodyLabel(textAlignment: .center)

    init(card: Card) {
        selectedCard = card
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: .systemThinMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.frame = view.bounds
        blurView.clipsToBounds = true
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(blurView)
        blurView.contentView.addSubViews(cardDetailHeaderView, cardDescriptionLabel)
        
        cardDescriptionLabel.text = selectedCard.description
        
        NSLayoutConstraint.activate([
            cardDetailHeaderView.topAnchor.constraint(equalTo: blurView.contentView.topAnchor),
            cardDetailHeaderView.leadingAnchor.constraint(equalTo: blurView.contentView.leadingAnchor),
            cardDetailHeaderView.trailingAnchor.constraint(equalTo: blurView.contentView.trailingAnchor),
            cardDetailHeaderView.heightAnchor.constraint(equalToConstant: 50),
            
            cardDescriptionLabel.topAnchor.constraint(equalTo: cardDetailHeaderView.bottomAnchor),
            cardDescriptionLabel.leadingAnchor.constraint(equalTo: blurView.contentView.leadingAnchor, constant: 10),
            cardDescriptionLabel.trailingAnchor.constraint(equalTo: blurView.contentView.trailingAnchor, constant: -10),
            cardDescriptionLabel.bottomAnchor.constraint(equalTo: blurView.contentView.bottomAnchor, constant: -10)
        ])
    }
    
    private func configureCardDescription() {
        
    }
}
