//
//  TabBarControllerAssembly.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct TabBarControllerAssembly {
    
    let controllersAssembly = ControllersForTabBarAssembly()
    
    func appleTabBar() -> UITabBarController {
        let tabBar = TabBarController()
        tabBar.viewControllers = controllersAssembly.viewControllers()
        return tabBar
    }
}
