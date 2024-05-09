//
//  XKThemeExtension.swift
//  XKThemeManager
//
//  Created by kenneth on 2024/5/8.
//

import Foundation

@available(iOS 13.0, *)
public extension UIColor {
    
    @objc static let theme_white = UIColor.init(light: .white, dark: .black)
    
    @objc convenience init(light: UIColor, dark: UIColor) {
        self.init { collection in
            return collection.userInterfaceStyle == .dark ? dark : light
        }
    }
    
}

public extension UIViewController {
    @objc func theme_viewWillAppear(_ animated: Bool) {
        if #available(iOS 13.0, *) {
            XKThemeManager.shared.viewWillAppear(controller: self)
        }
        theme_viewWillAppear(animated)
    }
}
