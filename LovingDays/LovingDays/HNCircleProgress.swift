//
//  HNCircleProgress.swift
//  LovingDays
//
//  Created by ThanhHai on 10/31/18.
//  Copyright © 2018 ThanhHai. All rights reserved.
//

import UIKit

class HNCircleProgress: UIView {
    
    private let shapeLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()
    private lazy var pulsingLayer = CAShapeLayer()
    var imageView: UIImageView?
    
    //Progress layer
    var currentProgress: CGFloat = 0.0 {
        didSet {
            shapeLayer.strokeEnd = currentProgress
        }
    }
    var progresColor: UIColor = .red {
        didSet {
            shapeLayer.strokeColor = progresColor.cgColor
        }
    }
    
    //Track layer
    var trackColor: UIColor = .lightGray  {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
    var showTrackLayer: Bool = true {
        didSet {
            self.trackLayer.isHidden = !showTrackLayer
        }
    }
    
    //Pulsing layer
    var pulsingColor: UIColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.2)  {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    var showPulsingLayer: Bool = false {
        didSet {
            self.pulsingLayer.isHidden = !showPulsingLayer
        }
    }
    //Center image
    var centerImage = UIImage() {
        didSet {
            imageView?.image = centerImage
        }
    }

    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print(self.frame)
        print(self.bounds)
        setupLayerByCode()
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func setupLayerByCode() {
        let vw = UIView()
        self.addSubview(vw)

        vw.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        vw.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        vw.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        vw.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = .lightGray
        
    }
    
    private func setupLayer() {
        setupPulsingLayer()
        shapeLayer.lineWidth = 10
        let radius = self.frame.width / 2 - shapeLayer.lineWidth
        let circularPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.strokeColor = progresColor.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.position = self.center
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        
        trackLayer.lineWidth = 10
        trackLayer.path = circularPath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.strokeEnd = 1
        trackLayer.position = self.center
        
        
        
        imageView = {
            let imv = UIImageView()
            
            let frame = CGRect(x: 15, y: 15, width: self.frame.width - 30, height: self.frame.height - 30)
            imv.frame = frame
            imv.clipsToBounds = true
            imv.contentMode = ContentMode.scaleAspectFill
            imv.layer.cornerRadius = frame.width / 2
            imv.backgroundColor = .clear
            return imv
        }()
        if let imageView = self.imageView {
            self.addSubview(imageView)
        }
        
        
        self.layer.addSublayer(trackLayer)
        self.layer.addSublayer(shapeLayer)
    }
    
    private func setupPulsingLayer() {
        pulsingLayer.lineWidth = 0
        let radius = self.frame.width / 2 - 5
        let circularPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        pulsingLayer.path = circularPath.cgPath
        pulsingLayer.fillColor = UIColor.clear.cgColor
        let rgbaProgress = progresColor.rgba
        pulsingLayer.strokeColor = pulsingColor.cgColor
        pulsingLayer.strokeEnd = 1
        pulsingLayer.position = self.center
        
        let basicAnimation = CABasicAnimation(keyPath: "lineWidth")
        
        basicAnimation.toValue = 20
        basicAnimation.duration = 1.5
        
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.autoreverses = true
        basicAnimation.repeatCount = Float.infinity
        pulsingLayer.add(basicAnimation, forKey: "urSoBasic")
        pulsingLayer.isHidden = true
        self.layer.addSublayer(pulsingLayer)
        
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}
