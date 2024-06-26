//
//  BaseApp+Scene.swift
//  UIKit-Plus
//
//  Created by Mihael Isaev on 11.09.2020.
//

#if !os(macOS)
import UIKit

extension BaseApp {
    public class Scene: _AnyScene, AppBuilderContent {
        public var appBuilderContent: AppBuilderItem { .scene(self) }
        
        public var persistentIdentifier: String = UUID().uuidString
        public var stateRestorationActivity: NSUserActivity?
        public var userInfo: [String : Any]?
        
        var _onConnect: ((UIWindow?) -> Void)?
        var _onDisconnect: ((UIWindow?) -> Void)?
        var _onDestroy: ((UIWindow?) -> Void)?
        var _onBecomeActive: ((UIWindow?) -> Void)?
        var _onWillResignActive: ((UIWindow?) -> Void)?
        var _onWillEnterForeground: ((UIWindow?) -> Void)?
        var _onDidEnterBackground: ((UIWindow?) -> Void)?
        
        var _onWillContinueUserActivityWithType: ((UIWindow?, _ userActivityType: String) -> Void)?
        var _onContinueUserActivity: ((UIWindow?, _ userActivity: NSUserActivity) -> Void)?
        var _onDidFailToContinueUserActivityWithType: ((UIWindow?, _ userActivityType: String, _ error: any Error) -> Void)?
        var _onDidUpdateUserActivity: ((UIWindow?, _ userActivity: NSUserActivity) -> Void)?
        var _onOpenURLContexts: ((UIWindow?, _ URLContexts: Set<UIOpenURLContext>) -> Void)?
    }
}
#endif
