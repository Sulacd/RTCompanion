//
//  CardsDisplayVC.swift
//  RTCompanion
//
//  Created by Christian Diaz on 8/1/22.
//

import UIKit

class CardsDisplayVC: UIViewController {
    
    var regionSelected1 : String?
    var regionSelected2 : String?
    
    let stackView = UIStackView()
    let regionBubble1 = RCInfoView()
    let regionBubble2 = RCInfoView()
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Category, Card>!
    
    var bcCardList = BCCardList()
    
    init(region1: String?, region2: String?) {
        super.init(nibName: nil, bundle: nil)
        regionSelected1 = region1
        regionSelected2 = region2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureVC()
        configureDataSource()
        updateData(on: bcCardList.cardList)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureVC() {
        title = "Card Display"
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(collectionView)
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: self.view))
        
        collectionView.backgroundColor = .systemGroupedBackground
        
        collectionView.delegate = self
        
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseId, for: indexPath) as! CardCell
            cell.cardImageView.image = itemIdentifier.cardFace
            return cell
        })
    }
    
    private func updateData(on cards: [Card]) {
        var snapShot = NSDiffableDataSourceSnapshot<Category, Card>()
        
        for category in Category.allCases {
            let cards = cards.filter { $0.category == category}
            snapShot.appendSections([category])
            snapShot.appendItems(cards, toSection: category)
        }
        
        dataSource.apply(snapShot, animatingDifferences: true)
    }
}

extension CardsDisplayVC: UICollectionViewDelegate {
    
}
