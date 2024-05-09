//
//  XKThemeManager.swift
//  XKThemeManager
//
//  Created by kenneth on 2024/5/8.
//

import UIKit

@available(iOS 13.0, *)
@objcMembers
open class XKThemeManager: NSObject {
    
    public static let shared = XKThemeManager()
    
    /// swizz记录
    static var didSwizz = false
    
    public var style: UIUserInterfaceStyle = .light
    
    /// 前置工作
    open class func preparedWork() {
        startHook()
    }
    
    open func start() {
        start(controller: nil)
    }
    
    open func stop() {
        stop(controller: nil)
    }
    
    open func start(controller: UIViewController? = nil) {
        startTheme(controller: controller)
    }
    
    open func stop(controller: UIViewController? = nil) {
        stopTheme(controller: controller)
    }
}

@available(iOS 13.0, *)
extension XKThemeManager {
    
    func startTheme(controller: UIViewController? = nil) {
        
        style = .dark
        UIApplication.shared.statusBarStyle = .darkContent
        
        if let controller = controller {
            controller.overrideUserInterfaceStyle = style
            controller.navigationController?.overrideUserInterfaceStyle = style
            controller.tabBarController?.overrideUserInterfaceStyle = style
            return
        }
        
        guard let window = UIApplication.shared.delegate?.window as? UIWindow else { return }
        window.overrideUserInterfaceStyle = style
        
    }
    
    func stopTheme(controller: UIViewController? = nil) {
        
        style = .light
        UIApplication.shared.statusBarStyle = .lightContent
        
        if let controller = controller {
            controller.overrideUserInterfaceStyle = style
            controller.navigationController?.overrideUserInterfaceStyle = style
            controller.tabBarController?.overrideUserInterfaceStyle = style
            return
        }
        
        guard let window = UIApplication.shared.delegate?.window as? UIWindow else { return }
        window.overrideUserInterfaceStyle = style
    }
    
}

// MARK: - hook
@available(iOS 13.0, *)
extension XKThemeManager {
    
    class func startHook() {
        
        guard didSwizz == false else { return }
        
        didSwizz = true
        
        guard let sourceMethod = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.viewWillAppear(_:))),
        let themeMethod = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.theme_viewWillAppear(_:)))
        else { return }
        
        method_exchangeImplementations(sourceMethod, themeMethod)
        
    }
    
    func shouldStart(controller: UIViewController) -> Bool {
        
        if let protocolObj = controller as? XKThemeProtocol {
            return protocolObj.shouldStartTheme()
        }
        
        if let protocolObj = controller as? XKThemeOCProtocol {
            return protocolObj.shouldStartTheme?() ?? true
        }
        
        return false
    }
    
    func viewWillAppear(controller: UIViewController) {
        guard shouldStart(controller: controller) else {
            stopTheme(controller: controller)
            return
        }
        startTheme(controller: controller)
    }
    
//    func viewWillDisappear(controller: UIViewController) {}
}
