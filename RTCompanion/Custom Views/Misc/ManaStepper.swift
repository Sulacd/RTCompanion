//
//  ManaStepper.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/9/22.
//

import UIKit

protocol ManaStepperDelegate: AnyObject {
    func manaDidChange()
}

class ManaStepper: UIStepper {
    
    weak var delegate: ManaStepperDelegate!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        value = 1
        minimumValue = 0
        maximumValue = 9
        
        transform = self.transform.scaledBy(x: 1.25, y: 1.25)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addTarget(self, action: #selector(stepperValueDidChange), for: .valueChanged)
    }
    
    @objc private func stepperValueDidChange() {
        delegate.manaDidChange()
    }
    
}
