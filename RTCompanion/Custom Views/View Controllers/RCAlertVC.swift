//
//  RCAlertVC.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/1/22.
//

import UIKit

class RCAlertVC: UIViewController {
    
    let containerView = RCContainerView()
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        configureContainerView()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.titleLabel.text = alertTitle
        containerView.messageLabel.text = message
        containerView.actionButton.set(color: .systemPink, title: "Ok", systemImageName: "checkmark.circle")
        containerView.actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }

}
