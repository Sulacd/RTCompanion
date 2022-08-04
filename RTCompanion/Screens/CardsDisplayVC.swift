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
        updateData(on: bcCardList)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureVC() {
        title = "Card Display"
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(collectionView)
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createCompositionalLayout())
    
        collectionView.collectionViewLayout = UIHelper.createCompositionalLayout()
        
        collectionView.backgroundColor = .systemGroupedBackground
        
        collectionView.delegate = self
        
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseId)
        collectionView.register(
          CollectionViewHeaderReusableView.self,
          forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
          withReuseIdentifier: CollectionViewHeaderReusableView.reuseId
        )
        
        //collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDataSource() {

        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseId, for: indexPath) as! CardCell
            cell.cardImageView.image = itemIdentifier.cardFace
            return cell
        })
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
        
          guard kind == UICollectionView.elementKindSectionHeader else {
            return nil
          }
        
          let view = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: CollectionViewHeaderReusableView.reuseId,
            for: indexPath) as? CollectionViewHeaderReusableView
    
          let section = self.dataSource.snapshot()
            .sectionIdentifiers[indexPath.section]
            view?.titleLabel.text = section.rawValue
          return view
        }
    }
    
    private func updateData(on cards: CardListProtocol) {
        var snapShot = NSDiffableDataSourceSnapshot<Category, Card>()
        
        for category in Category.allCases {
            let cards = cards.cardList.filter { $0.category == category}
            snapShot.appendSections([category])
            snapShot.appendItems(cards, toSection: category)
        }
        
        dataSource.apply(snapShot, animatingDifferences: true)
    }
}

extension CardsDisplayVC: UICollectionViewDelegate {
    
}
