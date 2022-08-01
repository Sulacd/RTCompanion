//
//  RegionCell.swift
//  RTCompanion
//
//  Created by Christian Diaz on 7/27/22.
//

import UIKit

class RegionCell: UICollectionViewCell {
    
    static let reuseID = "RegionCell"
    
    let regionImageView = RegionImageView(frame: .zero)
    let regionLabel = RCTitleLabel(textAlignment: .center, fontSize: 16)
    let selectedCell = SelectedCellView(frame: .zero)
    
    var isPressed = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        contentView.backgroundColor = .secondarySystemGroupedBackground

        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        contentView.addSubViews(regionImageView)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            regionImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            regionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            regionImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            regionImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
        
    }
    
}
