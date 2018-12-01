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

    
    var progress : HNCircleProgress?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupProgress()
        viewWidthConstraint.constant = viewWidthConstraint.constant * UIScreen.main.bounds.width / 375
        self.vwProgress.layoutIfNeeded()

        vwProgress.backgroundColor = .clear
//        vwProgress.addSubview(progress!)
        
        
    }
    
    //MARK : - ACTION
    override func tapSetting() {
        print("abc")
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

