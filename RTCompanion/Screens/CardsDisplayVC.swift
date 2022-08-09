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
    
    let manaSlider = ManaSlider()
    var manaCountLabel = ManaCntLabel()
    
// MARK: - Initializers

    init(region1: UIImage?, region2: UIImage?) {
        super.init(nibName: nil, bundle: nil)
        if let region1 = region1, let region2 = region2 {
            cardDisplayTitleView = CardDisplayTitleView(region1: region1, region2: region2)
        }
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
        updateData(on: bcCardList)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
// MARK: - UI Configurations
    
    private func configureVC() {
        navigationItem.titleView = cardDisplayTitleView
        view.backgroundColor = .systemGroupedBackground
        manaSlider.delegate = self
        
        view.addSubViews(collectionView, manaSlider, manaCountLabel)
        
        NSLayoutConstraint.activate([

            manaSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            manaSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            manaSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            manaCountLabel.centerXAnchor.constraint(equalTo: manaSlider.centerXAnchor),
            manaCountLabel.bottomAnchor.constraint(equalTo: manaSlider.topAnchor, constant: -10),
            
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
    
    private func updateData(on cards: CardListProtocol) {
        var snapShot = NSDiffableDataSourceSnapshot<Category, Card>()
        
        // Since Catefory is an enum, the cases act as its identifiers
        for category in Category.allCases {
            let cards = cards.cardList.filter { $0.category == category}
            snapShot.appendSections([category])
            snapShot.appendItems(cards, toSection: category)
        }
        
        dataSource.apply(snapShot, animatingDifferences: true)
    }
}

// MARK: - Extensions

extension CardsDisplayVC: UICollectionViewDelegate {
    
}

extension CardsDisplayVC: ManaSliderDelegate {
    func manaDidChange() {
        var manaCntIndicator: String
        if manaSlider.value == 9.0 {
            manaCntIndicator = "\(Int(manaSlider.value))+ Mana"
        }
        else {
            manaCntIndicator = "\(Int(manaSlider.value)) Mana"
        }
        manaCountLabel.text = manaCntIndicator
    }
    
    // append or filter the main array based on mana cnt
    // Call updateData on main array
}
