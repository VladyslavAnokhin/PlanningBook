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
    
    var viewControllersForTabBar: [UIViewController]!
    
    func rootController() -> UIViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation = storyboard.instantiateInitialViewController() as! UINavigationController
        navigation.navigationBar.isTranslucent = false
        let tabBar = navigation.viewControllers.first as! TabBarController
        
        let dataSource = ColorTabsDataSource()
        dataSource.viewControllers = viewControllersForTabBar
        
        tabBar.tabBarDataSource = dataSource
        
        return navigation
    }
    
}
