//
//  MainVC.swift
//  LovingDays
//
//  Created by ThanhHai on 10/30/18.
//  Copyright © 2018 ThanhHai. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    private func configView() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
        
        setupRemaining()
        setupRightNavBtn()
        setupLeftNavBtn()
    }
    
    private func setupRemaining() {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.text = "LOVING DAYS"
        lbl.textColor = .white
        self.navigationItem.titleView = lbl
    }
    
    private func setupRightNavBtn() {
        let settingBtn = UIButton(type: .custom)
        settingBtn.clipsToBounds = true
        settingBtn.imageView?.contentMode = .scaleAspectFill
        settingBtn.setImage(UIImage(named: "settings"), for: .normal)
        settingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: settingBtn)
        
    }
    
    private func setupLeftNavBtn() {
        let settingBtn = UIButton(type: .custom)
        settingBtn.clipsToBounds = true
        settingBtn.imageView?.contentMode = .scaleAspectFill
        settingBtn.setImage(UIImage(named: "settings"), for: .normal)
        settingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settingBtn)
    }
}
