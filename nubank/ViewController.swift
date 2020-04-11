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
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 2.0
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var collectionOptionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .nubankMainColor
        collectionView.showsHorizontalScrollIndicator = false
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
            boxView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.center.x),
            boxView.heightAnchor.constraint(equalToConstant: view.center.y * 0.8),
            boxView.trailingAnchor.constraint(equalTo: view.trailingAnchor,  constant: -20),
            boxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20)
        ])
        
        // collection view constraints
        NSLayoutConstraint.activate([
            collectionOptionView.heightAnchor.constraint(equalToConstant: 200),
            collectionOptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionOptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionOptionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        textLabelView.center.x = imageIconView.center.x
        textLabelView.center.y = imageIconView.center.y
    }
    
}

enum Options: String, CaseIterable {
    case indicar = "Indique\nAmigos"
    case transfira = "Transferir"
    case deposite = "Depositar"
    case pague = "Pagar"
}

extension ViewController : CollectionViewProtocols {
    
    func setupCollectionView() {
        collectionOptionView.register(OptionsCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Options.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
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
