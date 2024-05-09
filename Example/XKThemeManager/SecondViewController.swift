//
//  SecondViewController.swift
//  XKThemeManager_Example
//
//  Created by kenneth on 2024/5/8.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import XKThemeManager

class SecondViewController: UIViewController, XKThemeProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .theme_white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /*
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor         = .yellow
        appearance.shadowColor             = .yellow
        navigationController?.navigationBar.standardAppearance   = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
         */
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let vc = SecondWhiteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
