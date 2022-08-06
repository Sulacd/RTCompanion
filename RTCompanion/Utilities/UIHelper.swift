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
    
    static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.26), heightDimension: .fractionalHeight(0.14)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)

        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        section.supplementariesFollowContentInsets = false
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    static func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
    }
}


