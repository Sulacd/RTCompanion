//
//  SelectedCellView.swift
//  RTCompanion
//
//  Created by Christian Diaz on 7/30/22.
//

import UIKit

class SelectedCellView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        let checkMarkView = configureCheckMark()
        addSubview(checkMarkView)
        
        let padding: CGFloat = 5
        
        NSLayoutConstraint.activate([
            checkMarkView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            checkMarkView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            checkMarkView.heightAnchor.constraint(equalToConstant: 25),
            checkMarkView.widthAnchor.constraint(equalTo: checkMarkView.heightAnchor)
        ])
    }
    
    func configureCheckMark() -> UIImageView {
        let checkMark = UIImage(systemName: "checkmark.circle.fill")
        checkMark?.withTintColor(.systemBlue)
        let checkMarkView = UIImageView(image: checkMark)
        checkMarkView.translatesAutoresizingMaskIntoConstraints = false
        return checkMarkView
    }
}
