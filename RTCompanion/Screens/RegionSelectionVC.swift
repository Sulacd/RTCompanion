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
    let actionButton = RCButton(color: .systemTeal, title: "Get Cards", systemImageName: "square.stack.3d.up")
    
    var regionSelected1: RCImageView!
    var regionSelected2: RCImageView!
    
    var numOfCellsSelected = 0

// MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureVC()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
// MARK: - Configurations & Layout Constraints
    
    private func configureVC() {
        title = "Selection"
        view.backgroundColor = .systemGroupedBackground
        view.addSubViews(actionButton, collectionView)
        
        actionButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: actionButton.topAnchor),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: self.view))
        
        collectionView.backgroundColor = .systemGroupedBackground
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(RegionCell.self, forCellWithReuseIdentifier: RegionCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
// MARK: - Action Button Functionality
    
    @objc private func showAlert() {
        if numOfCellsSelected < 2 {
            presentRCAlert(title: "Error", message: "Please select your oponent's two regions", buttonTitle: "Ok")
        }
        else {
            let cardsDisplayVC = CardsDisplayVC(region1: regionSelected1, region2: regionSelected2)
            navigationController?.pushViewController(cardsDisplayVC, animated: true)
        }
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
                    
                    if let _ = regionSelected1 {
                        cell.regionNum = 2
                        regionSelected2 = cell.regionImageView
                        return
                    }
                    cell.regionNum = 1
                    regionSelected1 = cell.regionImageView
                    return
                }
                return
            }
            cell.isPressed = false
            numOfCellsSelected -= 1
            cell.selectedCell.removeFromSuperview()
            
            if cell.regionNum == 1 {
                regionSelected1 = nil
            }
            else {
                regionSelected2 = nil
            }
            cell.regionNum = nil
        }
    }
}

extension RegionSelectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return regions.regionIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RegionCell.reuseID, for: indexPath) as! RegionCell
        cell.regionImageView.image = regions.regionIcons[indexPath.row]
        return cell
    }
}
