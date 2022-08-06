//
//  ManaSlider.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/6/22.
//

import UIKit

class ManaSlider: UISlider {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        minimumValue = 0
        maximumValue = 9
        value = 1
    
        isContinuous = true
        
        tintColor = .systemCyan
        
        let cyanVialMin = UIImage(systemName: "cross.vial")?.withTintColor(.systemPink)
        let cyanVialMax = UIImage(systemName: "cross.vial.fill")?.withTintColor(.systemPink)
        minimumValueImage = cyanVialMin
        maximumValueImage = cyanVialMax
        minimumTrackTintColor = .systemCyan
        maximumTrackTintColor = .systemGray3
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addTarget(self, action: #selector(sliderValueDidChange), for: .valueChanged)
    }
    
    @objc private func sliderValueDidChange() {
        let roundedValue = round(value / 1.0) * 1.0
        value = roundedValue
    }
}


