//
//  CustomBoxView.swift
//  nubank
//
//  Created by VInicius Mesquita on 09/04/20.
//  Copyright © 2020 VInicius Mesquita. All rights reserved.
//

import Foundation
import UIKit

class CustomBoxView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.register(CustomBoxViewCell.self, forCellWithReuseIdentifier: "cellId")
        self.delegate = self
        self.backgroundColor = .nubankMainColor
        self.dataSource = self
        setupGestures()
    }

    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func setupGestures() {
        // gestures
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(animateSwipeDown(gesture:)))
        swipeDown.direction = .down
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(animateSwipeUp(gesture:)))
        swipeUp.direction = .up
        
        self.addGestureRecognizer(swipeDown)
        self.addGestureRecognizer(swipeUp)
    }
    
    // gestures
     @objc func animateSwipeDown(gesture: UISwipeGestureRecognizer) {
         
         if gesture.direction == .down {
             print(gesture.direction)
             self.layer.position.y += 300
         }
         
     }
     
     @objc func animateSwipeUp(gesture: UISwipeGestureRecognizer) {
         
            if gesture.direction == .up {
                print(gesture.direction)
                self.layer.position.y -= 300
            }
        }
}

extension CustomBoxView: CollectionViewProtocols {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CustomBoxViewCell
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.frame.width - 20, height: self.frame.height - 20)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

