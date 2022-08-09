//
//  ManaNumLabel.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/6/22.
//

import UIKit

class ManaCntLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        text = "1 Mana"
        textAlignment = .center
        textColor = .label
        backgroundColor = .secondarySystemGroupedBackground
        layer.borderWidth = 0.8
        layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40),
            widthAnchor.constraint(equalToConstant: 80)
        ])
    }

}
