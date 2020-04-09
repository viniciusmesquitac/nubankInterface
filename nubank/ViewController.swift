//
//  ViewController.swift
//  nubank
//
//  Created by VInicius Mesquita on 09/04/20.
//  Copyright © 2020 VInicius Mesquita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var textLabelView: UILabel = {
        let label = UILabel()
        label.text = "Vinicius"
        label.textColor = .white
        label.font = label.font.withSize(25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Nubank_Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var boxView: CustomBoxView = {
        let view = CustomBoxView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        return view
    }()
    
    // creating collection view layout [ work around to vertical collection view ]
    lazy var compositionalLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self]
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            return self?.setupCellsLayoutSection()
        }
        return layout
    }()
    
    lazy var collectionOptionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .nubankMainColor
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .nubankMainColor
        
        buildViewHierachy()
        setupConstraints()
        setupCollectionView()
    }
    
    func buildViewHierachy() {
        view.addSubview(boxView)
        view.addSubview(textLabelView)
        view.addSubview(imageIconView)
        view.addSubview(collectionOptionView)
        view.bringSubviewToFront(boxView)
    }
    
    func setupConstraints() {
        
        // Image icon logo nubank constraints
        NSLayoutConstraint.activate([
            imageIconView.bottomAnchor.constraint(equalTo: boxView.topAnchor, constant: -30),
            imageIconView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60),
            imageIconView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // text view name user constraints
        NSLayoutConstraint.activate([
            textLabelView.bottomAnchor.constraint(equalTo: boxView.topAnchor, constant: -30),
            textLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            textLabelView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // box view constraints
        NSLayoutConstraint.activate([
            boxView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50),
            boxView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            boxView.heightAnchor.constraint(equalToConstant: 300),
            boxView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        // collection view constraints
        NSLayoutConstraint.activate([
            collectionOptionView.topAnchor.constraint(equalTo: boxView.bottomAnchor, constant: 50),
            collectionOptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionOptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionOptionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
        
        
        textLabelView.center.x = imageIconView.center.x
        textLabelView.center.y = imageIconView.center.y
    }
    
    
    func setupCellsLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1.0)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0.0,
                                                     leading: 8.0,
                                                     bottom: 0.0,
                                                     trailing: 8.0)
        // Group
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(120),
                                               heightDimension: .absolute(120)),
                                                                subitem: item,
                                                                count: 1)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16.0,
                                                        leading: 0.0,
                                                        bottom: 16.0,
                                                        trailing: 0.0)
        
        // 2. Magic: Horizontal Scroll.
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
}



enum Options: String, CaseIterable {
    case indicar = "Indique\nAmigos"
    case transfira = "Transferir"
    case deposite = "Depositar"
    case pague = "Pagar"
}

typealias CollectionViewProtocols = UICollectionViewDelegateFlowLayout & UICollectionViewDataSource

extension ViewController : CollectionViewProtocols {
    
    func setupCollectionView() {
        collectionOptionView.register(OptionsCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Options.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionOptionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! OptionsCollectionViewCell
        cell.backgroundColor = .none
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.backgroundColor = UIColor.nubankCardColor.cgColor
        cell.textLabel.text = Options.allCases[indexPath.row].rawValue
        
        
        // setting image icon
        switch Options.allCases[indexPath.row] {
        case .deposite:
            cell.imageIconView.image = UIImage(named: "deposit")
        case .indicar:
            cell.imageIconView.image = UIImage(named: "invite")
            cell.textLabel.lineBreakMode = .byTruncatingHead
            cell.textLabel.numberOfLines = 2
            cell.textLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 15).isActive = true
        case .pague:
            cell.imageIconView.image = UIImage(named: "pay")
        case .transfira:
            cell.imageIconView.image = UIImage(named: "deposit")
        }
        
        return cell
    }
    
    
}
