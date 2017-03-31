//
//  AppDelegate.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    var appConfigurator: AppConfiguratorProtocol!
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        appConfigurator = TabBarAppConfigurator()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appConfigurator.rootController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

protocol AppConfiguratorProtocol{
    func rootController() -> UIViewController
}

struct TabBarAppConfigurator: AppConfiguratorProtocol {
    
    let tabBarAssembly = TabBarControllerAssembly()
    
    func rootController() -> UIViewController{
        return tabBarAssembly.appleTabBar()
    }
    
}
