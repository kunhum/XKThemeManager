//
//  SecondWhiteViewController.swift
//  XKThemeManager_Example
//
//  Created by kenneth on 2024/5/8.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import XKThemeManager

class SecondWhiteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "第二页白色"
        
        view.backgroundColor = .theme_white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        debugPrint("\(SecondViewController.description()) will appear")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let vc = SecondBlackOCViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
