//
//  CollectionViewHeaderReusableView.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/3/22.
//

import UIKit

class CollectionViewHeaderReusableView: UICollectionReusableView {
    
    static let reuseId = "CollectionViewHeaderReusableView"
    
    var titleLabel = RCTitleLabel(textAlignment: .left, fontSize: 25)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTitle() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
