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
    var tabBarController: UIViewController!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = appConfigurator.rootController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

@objc protocol AppConfiguratorProtocol{
    func rootController() -> UIViewController
}

class TabBarAppConfigurator: NSObject, AppConfiguratorProtocol{
    
    func rootController() -> UIViewController {
        let 
        let tabBar = TabBarController()
        let navigation = UINavigationController(rootViewController: tabBar)
        navigation.navigationBar.isTranslucent = false
        let dataSource = ColorTabsDataSource()
        dataSource.viewControllers = tabBar.viewControllers
        tabBar.tabBarDataSource = dataSource
        return navigation
    }
    
}
