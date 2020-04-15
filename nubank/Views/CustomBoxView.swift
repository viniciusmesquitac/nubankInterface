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
        self.isUserInteractionEnabled = false
        setupGestures()
    }

    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func setupGestures() {
        /* creating and adding gestures */
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(animateSwipeDown(gesture:)))
         swipeDown.direction = .down
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(animateSwipeUp(gesture:)))
        swipeUp.direction = .up
        
        self.addGestureRecognizer(swipeDown)
        self.addGestureRecognizer(swipeUp)
    }
    
     @objc func animateSwipeDown(gesture: UISwipeGestureRecognizer) {
        
      let swipeDown = UIPanGestureRecognizer(target: self, action: #selector(animateDown(gesture:)))
        
        if gesture.direction == .down {
            let location = gesture.location(in: self)
            print("location \(location)")
            self.addGestureRecognizer(swipeDown)
        }
    }
    
    @objc func animateSwipeUp(gesture: UISwipeGestureRecognizer) {
        let swipeDown = UIPanGestureRecognizer(target: self, action: #selector(animateDown(gesture:)))
        if gesture.direction == .up {
            self.addGestureRecognizer(swipeDown)
        }
    }

    
    /* work around */
    @objc func animateDown(gesture: UIPanGestureRecognizer) {
        
        if gesture.state == .changed {
            let translation = gesture.translation(in: self)
            if translation.y > -1.0 {
                print(translation.y)
                self.transform = CGAffineTransform(translationX: 0, y: translation.y)
            }
        }
        /* creating and animation to inital position */
        if gesture.state == .ended {
            print("removed")
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.transform = .identity
            })
            
            self.removeGestureRecognizer(gesture)
            
            
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

