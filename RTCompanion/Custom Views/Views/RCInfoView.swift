//
//  RCMInfoView.swift
//  RTCompanion
//
//  Created by Christian Diaz on 7/28/22.
//

import UIKit

class RCInfoView: UIView {

    let regionLabel = RCTitleLabel(textAlignment: .center, fontSize: 20)
    let selectedIcon = RCImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.backgroundColor = .clear
        
        configureVisualEffect()
    
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func configureVisualEffect() {
        let blurEffect = UIBlurEffect(style: .systemThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.frame = self.bounds
        blurView.layer.cornerRadius = 40
        blurView.clipsToBounds = true
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.addSubview(blurView)
        selectedIcon.image = Icons.shurima
        blurView.contentView.addSubview(selectedIcon)
        
        NSLayoutConstraint.activate([
            selectedIcon.topAnchor.constraint(equalTo: blurView.contentView.topAnchor),
            selectedIcon.leadingAnchor.constraint(equalTo: blurView.contentView.leadingAnchor),
            selectedIcon.trailingAnchor.constraint(equalTo: blurView.contentView.trailingAnchor),
            selectedIcon.bottomAnchor.constraint(equalTo: blurView.contentView.bottomAnchor)
        ])
    }
    
    func setImage(with icon: UIImage) {
        selectedIcon.image = icon
    }
    
}
