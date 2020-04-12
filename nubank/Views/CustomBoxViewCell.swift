//
//  CustomBoxViewCell.swift
//  nubank
//
//  Created by VInicius Mesquita on 10/04/20.
//  Copyright © 2020 VInicius Mesquita. All rights reserved.
//

import UIKit

class CustomBoxViewCell: UICollectionViewCell {
    
    var imageIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "creditcard")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var textLabelTitle: UILabel = {
        let label = UILabel()
        label.text = "FATURA FECHADA"
        label.textColor = .black
        label.font = label.font.withSize(10.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var textLabelPrice: UILabel = {
        let label = UILabel()
        label.text = "R$ 1.328,40"
        label.textColor = .black
        label.font = label.font.withSize(25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var textLabelWarning: UILabel = {
        let label = UILabel()
        label.text = "VENCIMENTO 25 MAR"
        label.textColor = .gray
        label.font = label.font.withSize(12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var bottomInfoView: BottominfoBoxView = {
        let view = BottominfoBoxView()
        view.backgroundColor = .customGray
        view.layer.cornerRadius = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 5.0
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildViewHierarchy() {
        self.addSubview(imageIconView)
        self.addSubview(textLabelTitle)
        self.addSubview(textLabelPrice)
        self.addSubview(textLabelWarning)
        self.addSubview(bottomInfoView)
    }
    
    
    func setupConstraints() {
        // image icon constraint
        NSLayoutConstraint.activate([
            imageIconView.heightAnchor.constraint(equalToConstant: 30),
            imageIconView.widthAnchor.constraint(equalToConstant: 30),
            imageIconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageIconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        ])
        
        // text title constraint
        NSLayoutConstraint.activate([
            textLabelTitle.topAnchor.constraint(equalTo: imageIconView.bottomAnchor, constant: 30),
            textLabelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
        // text price constraint
        NSLayoutConstraint.activate([
            textLabelPrice.topAnchor.constraint(equalTo: textLabelTitle.bottomAnchor, constant: 5),
            textLabelPrice.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
        // text warning constraint
        NSLayoutConstraint.activate([
            textLabelWarning.topAnchor.constraint(equalTo: textLabelPrice.bottomAnchor, constant: 5),
            textLabelWarning.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
        
        // footer constraint
        NSLayoutConstraint.activate([
            bottomInfoView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomInfoView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomInfoView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomInfoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4)
        ])
        
    }
}
