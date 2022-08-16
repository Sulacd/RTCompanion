//
//  ManaSlider.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/6/22.
//

import UIKit

protocol ManaSliderDelegate: AnyObject {
    func manaDidChange()
}

class ManaSlider: UISlider {
    
    weak var delegate: ManaSliderDelegate!
    
    //var timer: Timer? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.trackRect(forBounds: bounds)
        rect.size.height = 2
        return rect
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
        delegate.manaDidChange()
    }
//
//    // Debounce function taking a time interval to wait before firing after user input has stopped
//    // and a function to execute when debounce has stopped being called for a period of time.
//    private func debounce(seconds: TimeInterval, function: @escaping () -> Swift.Void ) {
//        timer?.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: seconds, repeats: false, block: { _ in
//            function()
//        })
//    }
    
}


