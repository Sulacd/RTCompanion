//
//  RCImageView.swift
//  RTCompanion
//
//  Created by Christian Diaz on 7/27/22.
//

import UIKit

class RCImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        clipsToBounds = true
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
    }

}
