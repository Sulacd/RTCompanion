//
//  CardsDisplayVC.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/1/22.
//

import UIKit

class CardsDisplayVC: UIViewController {
    
    var cardDisplayTitleView: CardDisplayTitleView!
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Category, Card>!
    
    var bcCardList = BCCardList()
    var mutableCardList: [Card] = []
    
    let manaStepper = ManaStepper()
    var manaCountLabel = ManaCntLabel()
    var manaValue: Int {
        didSet {
            if manaValue > oldValue {
                if let cardsByMana = bcCardList.cardListByMana[manaValue] {
                    mutableCardList.append(contentsOf: cardsByMana)
                    DispatchQueue.main.async {
                        self.updateData(on: self.mutableCardList)
                    }
                }
            }
            else if manaValue < oldValue {
                if let cardsByMana = bcCardList.cardListByMana[oldValue] {
                    mutableCardList = mutableCardList.filter {!cardsByMana.contains($0)}
                    DispatchQueue.main.async {
                        self.updateData(on: self.mutableCardList)
                    }
                }
            }
        }
    }
    
// MARK: - Initializers

    init(region1: UIImage?, region2: UIImage?) {
        manaValue = Int(manaStepper.value)
        super.init(nibName: nil, bundle: nil)
        if let region1 = region1, let region2 = region2 {
            cardDisplayTitleView = CardDisplayTitleView(region1: region1, region2: region2)
        }
        mutableCardList = bcCardList.cardListByMana[manaValue]!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
// MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureVC()
        configureDataSource()
        updateData(on: mutableCardList)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
// MARK: - UI Configurations
    
    private func configureVC() {
        navigationItem.titleView = cardDisplayTitleView
        view.backgroundColor = .systemGroupedBackground
        manaStepper.delegate = self
        
        view.addSubViews(collectionView, manaStepper, manaCountLabel)
        
        NSLayoutConstraint.activate([

            manaStepper.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            manaStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            manaCountLabel.centerXAnchor.constraint(equalTo: manaStepper.centerXAnchor),
            manaCountLabel.bottomAnchor.constraint(equalTo: manaStepper.topAnchor, constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: manaCountLabel.topAnchor),
        ])
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createCompositionalLayout())
        
        collectionView.backgroundColor = .systemGroupedBackground
        
        collectionView.delegate = self
        
        // *(Step 1)* Register the Card Cells and the Header View
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseId)
        collectionView.register(
          CollectionViewHeaderReusableView.self,
          forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
          withReuseIdentifier: CollectionViewHeaderReusableView.reuseId
        )
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
// MARK: - UICollection View Datasource Methods
    
    private func configureDataSource() {
        
        // *(Step 2)* Dequeues the reusable cell and section header with an idenitifier 
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, cardIdentifer in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseId, for: indexPath) as! CardCell
            // The cardIdentifer is the UUID property of the Card data object
            cell.cardImageView.image = cardIdentifer.cardFace
            return cell
        })
        
        // Adds header to datasource
        dataSource.supplementaryViewProvider = {[weak self] collectionView, kind, indexPath in
            guard let self = self else {return nil}
            
            guard kind == UICollectionView.elementKindSectionHeader else {
                return nil
            }
            
            // Renders a header view for all the sections
            let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: CollectionViewHeaderReusableView.reuseId,
                for: indexPath) as? CollectionViewHeaderReusableView
            
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            
            headerView?.titleLabel.text = section.rawValue
            
            return headerView
        }
    }
    
    private func updateData(on cards: [Card]) {
        var snapShot = NSDiffableDataSourceSnapshot<Category, Card>()
        
        // Since Catefory is an enum, the cases act as its identifiers
        for category in Category.allCases {
            let cardsByCategory = cards.filter { $0.category == category}
            snapShot.appendSections([category])
            snapShot.appendItems(cardsByCategory, toSection: category)
        }
        
        dataSource.apply(snapShot, animatingDifferences: true)
    }
    
    private func removeData(with identifier: [Card]) {
        var snapShot = NSDiffableDataSourceSnapshot<Category, Card>()
        snapShot.deleteItems(identifier)
        dataSource.apply(snapShot, animatingDifferences: true)
    }
    
}

// MARK: - Extensions

extension CardsDisplayVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let identifier = dataSource.itemIdentifier(for: indexPath) {
            let cardDetailVC = CardDetailVC(card: identifier)
            
            if let sheet = cardDetailVC.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 24.0
            }
            present(cardDetailVC, animated: true)
        }
    }
}

extension CardsDisplayVC: ManaStepperDelegate {
    func manaDidChange() {
        var manaCntIndicator: String
        if manaStepper.value == 9.0 {
            manaCntIndicator = "\(Int(manaStepper.value))+ Mana"
        }
        else {
            manaCntIndicator = "\(Int(manaStepper.value)) Mana"
        }
        manaCountLabel.text = manaCntIndicator
        manaValue = Int(manaStepper.value)
    }
}
