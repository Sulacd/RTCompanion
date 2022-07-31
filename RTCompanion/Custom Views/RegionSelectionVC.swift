//
//  RegionSelectionVC.swift
//  RTCompanion
//
//  Created by Christian Diaz on 7/27/22.
//

import UIKit

class RegionSelectionVC: UIViewController {
    
    let regions = Regions()
    
    var collectionView: UICollectionView!
    let stackView = UIStackView()
    let regionBubble1 = RCInfoView()
    let regionBubble2 = RCInfoView()
    
    var regionSelected1: String!
    var regionSelected2: String!
    
    var numOfCellsSelected = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        configureCollectionView()
        configureVC()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
// MARK: - Configurations
    
    private func configureVC() {
        title = "Selection"
        view.backgroundColor = .systemGroupedBackground
        view.addSubViews(stackView, collectionView)
        
        let padding: CGFloat = 100
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 80),

            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureStackView() {
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(regionBubble1)
        stackView.addArrangedSubview(regionBubble2)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: self.view))
        
        collectionView.backgroundColor = .systemGroupedBackground
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(RegionCell.self, forCellWithReuseIdentifier: RegionCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Extensions



extension RegionSelectionVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? RegionCell {
            
            guard cell.isPressed else {
                if numOfCellsSelected < 2 {
                    cell.selectedCell.frame = cell.contentView.bounds
                    cell.contentView.addSubview(cell.selectedCell)
                    cell.isPressed = true
                    numOfCellsSelected += 1
                    return
                }
                return
            }
            cell.isPressed = false
            numOfCellsSelected -= 1
            cell.selectedCell.removeFromSuperview()
        }
    }
}

extension RegionSelectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RegionCell.reuseID, for: indexPath) as! RegionCell
        cell.regionImageView.image = regions.regionIcons[indexPath.row]
        cell.regionLabel.text = regions.regionNames[indexPath.row]
        return cell
    }
}
