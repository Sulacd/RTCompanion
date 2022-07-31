//
//  UIHelper.swift
//  RTCompanion
//
//  Created by Christian Diaz on 7/27/22.
//

import UIKit

enum UIHelper {
    
    // Function that creates a collection view layout with 3 columns
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewLayout {
        let width = view.bounds.width
        let padding: CGFloat = 20
        let minimumItemSpacing: CGFloat = 5
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        // Layout of each cell with padding around each side
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding + 5, bottom: padding, right: padding + 5)
        // Size of each cell
        flowLayout.itemSize = CGSize(width: itemWidth - 20, height: itemWidth - 20)
        
        return flowLayout
    }
}
