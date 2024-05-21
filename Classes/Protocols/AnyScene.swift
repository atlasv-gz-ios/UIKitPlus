//
//  AnyScene.swift
//  UIKit-Plus
//
//  Created by Mihael Isaev on 11.09.2020.
//

#if !os(macOS)
import UIKit

public protocol AnyScene: AnyObject {
    var persistentIdentifier: String { get }
    var stateRestorationActivity: NSUserActivity? { get }
    var userInfo: [String : Any]? { get }
    
    // Called when scene has been connected to session
    func onConnect(_ handler: @escaping () -> Void) -> Self
    func onConnect(_ handler: @escaping (UIWindow?) -> Void) -> Self
    
    // Called when scene has been disconnected from session
    func onDisconnect(_ handler: @escaping () -> Void) -> Self
    func onDisconnect(_ handler: @escaping (UIWindow?) -> Void) -> Self
    
    // Called when scene has been completely removed
    func onDestroy(_ handler: @escaping () -> Void) -> Self
    func onDestroy(_ handler: @escaping (UIWindow?) -> Void) -> Self
    
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    func onBecomeActive(_ handler: @escaping (UIWindow?) -> Void) -> Self
    
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
    func onWillResignActive(_ handler: @escaping (UIWindow?) -> Void) -> Self

    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
    func onWillEnterForeground(_ handler: @escaping (UIWindow?) -> Void) -> Self

    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
    func onDidEnterBackground(_ handler: @escaping (UIWindow?) -> Void) -> Self
    
    func onWillContinueUserActivityWithType(_ hander: @escaping (UIWindow?, _ userActivityType: String) -> Void) -> Self
    func onContinueUserActivity(_ handler: @escaping (UIWindow?, _ userActivity: NSUserActivity) -> Void) -> Self
    func onDidFailToContinueUserActivityWithType(_ handler: @escaping (UIWindow?, _ userActivityType: String, _ error: any Error) -> Void) -> Self
    func onDidUpdateUserActivity(_ handler: @escaping (UIWindow?, _ userActivity: NSUserActivity) -> Void) -> Self
    func onOpenURLContexts(_ handler: @escaping (UIWindow?, _ URLContexts: Set<UIOpenURLContext>) -> Void) -> Self
}

protocol _AnyScene: AnyScene {
    var _onConnect: ((UIWindow?) -> Void)? { get set }
    var _onDisconnect: ((UIWindow?) -> Void)? { get set }
    var _onDestroy: ((UIWindow?) -> Void)? { get set }
    var _onBecomeActive: ((UIWindow?) -> Void)? { get set }
    var _onWillResignActive: ((UIWindow?) -> Void)? { get set }
    var _onWillEnterForeground: ((UIWindow?) -> Void)? { get set }
    var _onDidEnterBackground: ((UIWindow?) -> Void)? { get set }
    var _onWillContinueUserActivityWithType: ((UIWindow?, _ userActivityType: String) -> Void)? { get set }
    var _onContinueUserActivity: ((UIWindow?, _ userActivity: NSUserActivity) -> Void)? { get set }
    var _onDidFailToContinueUserActivityWithType: ((UIWindow?, _ userActivityType: String, _ error: any Error) -> Void)? { get set }
    var _onDidUpdateUserActivity: ((UIWindow?, _ userActivity: NSUserActivity) -> Void)? {get set }
    var _onOpenURLContexts: ((UIWindow?, _ URLContexts: Set<UIOpenURLContext>) -> Void)? { get set }
}

@available(iOS 13.0, *)
extension AnyScene {
    public func onConnect(_ handler: @escaping () -> Void) -> Self {
        (self as? _AnyScene)?._onConnect = { _ in
            handler()
        }
        return self
    }
    
    public func onConnect(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        (self as? _AnyScene)?._onConnect = handler
        return self
    }
    
    public func onDisconnect(_ handler: @escaping () -> Void) -> Self {
        (self as? _AnyScene)?._onDisconnect = { _ in
            handler()
        }
        return self
    }
    
    public func onDisconnect(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        (self as? _AnyScene)?._onDisconnect = handler
        return self
    }
    
    public func onDestroy(_ handler: @escaping () -> Void) -> Self {
        (self as? _AnyScene)?._onDestroy = { _ in
            handler()
        }
        return self
    }
    
    public func onDestroy(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        (self as? _AnyScene)?._onDestroy = handler
        return self
    }
    
    public func onBecomeActive(_ handler: @escaping () -> Void) -> Self {
        (self as? _AnyScene)?._onBecomeActive = { _ in
            handler()
        }
        return self
    }
    
    public func onBecomeActive(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        (self as? _AnyScene)?._onBecomeActive = handler
        return self
    }
    
    public func onWillResignActive(_ handler: @escaping () -> Void) -> Self {
        (self as? _AnyScene)?._onWillResignActive = { _ in
            handler()
        }
        return self
    }
    
    public func onWillResignActive(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        (self as? _AnyScene)?._onWillResignActive = handler
        return self
    }
    
    public func onWillEnterForeground(_ handler: @escaping () -> Void) -> Self {
        (self as? _AnyScene)?._onWillEnterForeground = { _ in
            handler()
        }
        return self
    }

    public func onWillEnterForeground(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        (self as? _AnyScene)?._onWillEnterForeground = handler
        return self
    }
    
    public func onDidEnterBackground(_ handler: @escaping () -> Void) -> Self {
        (self as? _AnyScene)?._onDidEnterBackground = { _ in
            handler()
        }
        return self
    }

    public func onDidEnterBackground(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        (self as? _AnyScene)?._onDidEnterBackground = handler
        return self
    }
    
    public func onWillContinueUserActivityWithType(_ hander: @escaping (UIWindow?, _ userActivityType: String) -> Void) -> Self {
        (self as? _AnyScene)?._onWillContinueUserActivityWithType = hander
        return self
    }

    public func onContinueUserActivity(_ handler: @escaping (UIWindow?, _ userActivity: NSUserActivity) -> Void) -> Self {
        (self as? _AnyScene)?._onContinueUserActivity = handler
        return self
    }
    
    public func onDidFailToContinueUserActivityWithType(_ handler: @escaping (UIWindow?, _ userActivityType: String, _ error: any Error) -> Void) -> Self {
        (self as? _AnyScene)?._onDidFailToContinueUserActivityWithType = handler
        return self
    }
    
    public func onDidUpdateUserActivity(_ handler: @escaping (UIWindow?, _ userActivity: NSUserActivity) -> Void) -> Self {
        (self as? _AnyScene)?._onDidUpdateUserActivity = handler
        return self
    }
    
    public func onOpenURLContexts(_ handler: @escaping (UIWindow?, _ URLContexts: Set<UIOpenURLContext>) -> Void) -> Self {
        (self as? _AnyScene)?._onOpenURLContexts = handler
        return self
    }
}

extension _AnyScene {
    public func onConnect(_ handler: @escaping () -> Void) -> Self {
        _onConnect = { _ in
            handler()
        }
        return self
    }
    
    public func onConnect(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        _onConnect = handler
        return self
    }
    
    public func onDisconnect(_ handler: @escaping () -> Void) -> Self {
        _onDisconnect = { _ in
            handler()
        }
        return self
    }
    
    public func onDisconnect(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        _onDisconnect = handler
        return self
    }
    
    public func onDestroy(_ handler: @escaping () -> Void) -> Self {
        _onDestroy = { _ in
            handler()
        }
        return self
    }
    
    public func onDestroy(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        _onDestroy = handler
        return self
    }
    
    public func onBecomeActive(_ handler: @escaping () -> Void) -> Self {
        _onBecomeActive = { _ in
            handler()
        }
        return self
    }
    
    public func onBecomeActive(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        _onBecomeActive = handler
        return self
    }
    
    public func onWillResignActive(_ handler: @escaping () -> Void) -> Self {
        _onWillResignActive = { _ in
            handler()
        }
        return self
    }
    
    public func onWillResignActive(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        _onWillResignActive = handler
        return self
    }
    
    public func onWillEnterForeground(_ handler: @escaping () -> Void) -> Self {
        _onWillEnterForeground = { _ in
            handler()
        }
        return self
    }

    public func onWillEnterForeground(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        _onWillEnterForeground = handler
        return self
    }
    
    public func onDidEnterBackground(_ handler: @escaping () -> Void) -> Self {
        _onDidEnterBackground = { _ in
            handler()
        }
        return self
    }

    public func onDidEnterBackground(_ handler: @escaping (UIWindow?) -> Void) -> Self {
        _onDidEnterBackground = handler
        return self
    }

    public func onWillContinueUserActivityWithType(_ hander: @escaping (UIWindow?, _ userActivityType: String) -> Void) -> Self {
        _onWillContinueUserActivityWithType = hander
        return self
    }

    public func onContinueUserActivity(_ handler: @escaping (UIWindow?, _ userActivity: NSUserActivity) -> Void) -> Self {
        _onContinueUserActivity = handler
        return self
    }
    
    public func onDidFailToContinueUserActivityWithType(_ handler: @escaping (UIWindow?, _ userActivityType: String, _ error: any Error) -> Void) -> Self {
        _onDidFailToContinueUserActivityWithType = handler
        return self
    }
    
    public func onDidUpdateUserActivity(_ handler: @escaping (UIWindow?, _ userActivity: NSUserActivity) -> Void) -> Self {
        _onDidUpdateUserActivity = handler
        return self
    }
    
    public func onOpenURLContexts(_ handler: @escaping (UIWindow?, _ URLContexts: Set<UIOpenURLContext>) -> Void) -> Self {
        _onOpenURLContexts = handler
        return self
    }
}

#endif
