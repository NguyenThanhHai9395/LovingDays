//
//  CircleProgress.swift
//  LovingDays
//
//  Created by ThanhHai on 12/14/18.
//  Copyright © 2018 ThanhHai. All rights reserved.
//

import UIKit

class CircleProgress: UIView {
    
    var frameRect: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    convenience init(bounds: CGRect) {
        self.init()
        frameRect = bounds
        self.buildUI()
    }
    
    private func buildUI() {
        self.backgroundColor = .green
    }
}
