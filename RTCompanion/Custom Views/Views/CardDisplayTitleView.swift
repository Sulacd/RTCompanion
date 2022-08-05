//
//  CardDisplayTitleView.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/4/22.
//

import UIKit

class CardDisplayTitleView: UIStackView {

    var regionSelected1 = RCImageView(frame: .zero)
    var regionSelected2 = RCImageView(frame: .zero)
    
    let test1 = RCImageView(frame: .zero)
    
    let test2 = UIImageView(image: Icons.bandleCity)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(region1: RCImageView, region2: RCImageView) {
        self.init(frame: .zero)
        regionSelected1 = region1
        regionSelected2 = region2
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        axis = .horizontal
        distribution = .equalSpacing
        
        addArrangedSubview(test1)
        addArrangedSubview(test2)
        
    }
}
