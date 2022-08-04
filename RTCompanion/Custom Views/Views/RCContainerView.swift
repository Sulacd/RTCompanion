//
//  RCContainerView.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/1/22.
//

import UIKit

class RCContainerView: UIView {
    
    var titleLabel = RCTitleLabel(textAlignment: .center, fontSize: 20)
    var messageLabel = RCBodyLabel(textAlignment: .center)
    var actionButton = RCButton(color: .systemPink, title: "Ok", systemImageName: "xmark.octagon")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContainerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let padding: CGFloat = 20

    
    private func configureContainerView() {
        backgroundColor = .clear
        layer.cornerRadius = 16
        translatesAutoresizingMaskIntoConstraints = false
        
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.frame = self.bounds
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 16
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addSubview(blurView)
        blurView.contentView.addSubViews(titleLabel, messageLabel, actionButton)

        configureTitleLabel()
        configureMessageLabel()
        configureActionButton()
    }
    
    private func configureTitleLabel() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func configureActionButton() {
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureMessageLabel() {
        
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
}
