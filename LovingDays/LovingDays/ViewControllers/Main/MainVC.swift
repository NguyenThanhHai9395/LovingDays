//
//  MainVC.swift
//  LovingDays
//
//  Created by ThanhHai on 10/30/18.
//  Copyright © 2018 ThanhHai. All rights reserved.
//

import UIKit

class MainVC: BaseVC {

    //MARK: - OUTLET
    @IBOutlet weak var vwProgress: UIView!
    
    @IBOutlet weak var viewWidthConstraint: NSLayoutConstraint!

    @IBOutlet weak var cvwLove: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var progress : HNCircleProgress?
    
    //MARK: - PROPERTIES
    let circleID = "circleCell"
    let countingID = "coutingCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupProgress()
        viewWidthConstraint.constant = viewWidthConstraint.constant * UIScreen.main.bounds.width / 375
        self.vwProgress.layoutIfNeeded()

        vwProgress.backgroundColor = .clear
//        vwProgress.addSubview(progress!)
        
        setupCollectionView()
        
    }
    
    private func setupCollectionView() {
        cvwLove.delegate = self
        cvwLove.dataSource = self
        cvwLove.register(UINib(nibName: "CircleCell", bundle: nil), forCellWithReuseIdentifier: circleID)
        cvwLove.register(UINib(nibName: "CountingCell", bundle: nil), forCellWithReuseIdentifier: countingID)
        cvwLove.backgroundColor = .clear
        cvwLove.showsHorizontalScrollIndicator = false
        
        let layout = UICollectionViewFlowLayout()
        let size = vwProgress.bounds.width
        layout.itemSize = CGSize(width: size, height: size)
        layout.scrollDirection = .horizontal
        cvwLove.collectionViewLayout = layout
        
    }
    
    //MARK : - ACTION
    override func tapSetting() {
        print("abc")
    }

    
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: circleID, for: indexPath) as! CircleCell
            cell.backgroundColor = .red
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: countingID, for: indexPath) as! CountingCell

            return cell
        default:
            return UICollectionViewCell()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if (context.nextFocusedIndexPath != nil) && !collectionView.isScrollEnabled {
            collectionView.scrollToItem(at: context.nextFocusedIndexPath!, at: UICollectionView.ScrollPosition.centeredVertically, animated: true)
        }
        
    }
    
}

extension MainVC: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.cvwLove.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: 0)
        UIView.animate(withDuration: 0.1) {
            targetContentOffset.pointee = offset
        }
        
        print(offset)
        if offset.x > layout.itemSize.width {
            pageControl.currentPage = 1
        } else {
            pageControl.currentPage = 0
        }

    }
}

extension MainVC {
    
    fileprivate func animateCircle() {
        let basicAnimation = CABasicAnimation(keyPath: "lineWidth")
        
        basicAnimation.toValue = 25
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.autoreverses = true
        basicAnimation.repeatCount = Float.infinity
        
//        let bAnimation = CABasicAnimation(keyPath: "lineWidth")
//        bAnimation.toValue = 20
//        bAnimation.duration = 3
//
//        bAnimation.autoreverses = true
        
//        shapeLayer.add(bAnimation, forKey: "urSoBasic")
        
    }
    
    @objc private func handleTap() {
        print("abc")
        
        animateCircle()
        
        
    }
}

