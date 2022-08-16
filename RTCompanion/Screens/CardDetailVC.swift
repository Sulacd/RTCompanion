//
//  CardDetailVC.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/14/22.
//

import UIKit

class CardDetailVC: UIViewController {
    
    var selectedCard: Card

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
        print(selectedCard.name)
    }

    private func configure() {
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: .systemThinMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.frame = view.bounds
        blurView.clipsToBounds = true
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(blurView)
    }
}
