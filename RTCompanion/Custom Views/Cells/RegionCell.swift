//
//  RegionCell.swift
//  RTCompanion
//
//  Created by Christian Diaz on 7/27/22.
//

import UIKit

class RegionCell: UICollectionViewCell {
    
    static let reuseID = "RegionCell"
    
    let regionImageView = RCImageView(frame: .zero)
    let selectedCell = SelectedCellView(frame: .zero)
    
    var isPressed = false
    // Optional int flag to determine which cell is marked region 1 and which is region 2
    var regionNum: Int?
    
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
        layer.masksToBounds = false
        
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        
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
