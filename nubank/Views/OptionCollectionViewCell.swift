//
//  OptionCollectionViewCell.swift
//  nubank
//
//  Created by VInicius Mesquita on 09/04/20.
//  Copyright © 2020 VInicius Mesquita. All rights reserved.
//

import Foundation
import UIKit

class OptionsCollectionViewCell: UICollectionViewCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = label.font.withSize(15.0)
        return label
    }()
    
    lazy var imageIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(textLabel)
        self.addSubview(imageIconView)
    }
    
    func setupConstraints() {
        // text label costraints
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40),
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
        ])
        
        // image icon constraints
        NSLayoutConstraint.activate([
            imageIconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageIconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            imageIconView.heightAnchor.constraint(equalToConstant: 30),
            imageIconView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        
    }
}
