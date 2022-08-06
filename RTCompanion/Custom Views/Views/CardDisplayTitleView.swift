//
//  CardDisplayTitleView.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/4/22.
//

import UIKit

class CardDisplayTitleView: UIStackView {

    var regionSelected1: UIImageView!
    var regionSelected2: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(region1: UIImage, region2: UIImage) {
        self.init(frame: .zero)
        regionSelected1 = UIImageView(image: region1)
        regionSelected2 = UIImageView(image: region2)
        
        configureStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        axis = .horizontal
        distribution = .equalSpacing
    
        addArrangedSubview(regionSelected1)
        addArrangedSubview(regionSelected2)
        
        regionSelected1.translatesAutoresizingMaskIntoConstraints = false
        regionSelected2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            regionSelected1.heightAnchor.constraint(equalToConstant: 40),
            regionSelected1.widthAnchor.constraint(equalTo: regionSelected1.heightAnchor),
            
            regionSelected2.heightAnchor.constraint(equalToConstant: 40),
            regionSelected2.widthAnchor.constraint(equalTo: regionSelected1.heightAnchor)
        ])
    }
    
    
}
