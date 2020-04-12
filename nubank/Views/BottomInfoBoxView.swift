//
//  BottomInfoBoxView.swift
//  nubank
//
//  Created by VInicius Mesquita on 11/04/20.
//  Copyright © 2020 VInicius Mesquita. All rights reserved.
//

import UIKit

class BottominfoBoxView: UIView {
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Compra mais recente em Empório\nGourmet no valor de R$ 199,40 hoje"
        label.textColor = .gray
        label.font = label.font.withSize(15.0)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var iconCategoryImageView: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "category-food")
        return icon
    }()
    
    var arrowImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "")
        return icon
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
        self.addSubview(iconCategoryImageView)
        self.addSubview(textLabel)
    }
    
    func setupConstraints() {
        
        // category image view
        NSLayoutConstraint.activate([
            iconCategoryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            iconCategoryImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            iconCategoryImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            iconCategoryImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        // text label
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: iconCategoryImageView.trailingAnchor, constant: 10),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
}
