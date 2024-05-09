//
//  XKThemeProtocol.swift
//  XKThemeManager
//
//  Created by kenneth on 2024/5/8.
//

import Foundation

// 只要遵循协议默认视为需要开启，如需关闭，不遵循协议或 shouldStartTheme返回false
/// swift theme 协议
public protocol XKThemeProtocol {
    func shouldStartTheme() -> Bool
}
public extension XKThemeProtocol where Self: UIViewController {
    func shouldStartTheme() -> Bool { true }
}
/// oc theme 协议
@objc public protocol XKThemeOCProtocol: NSObjectProtocol {
    @objc optional
    func shouldStartTheme() -> Bool
}
