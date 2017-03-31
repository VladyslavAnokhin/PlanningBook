//
//  TodayModuleAssembly.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/30/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct TodayModuleAssembly {
    
    let storyboardAssembly = StoryboardAssebmly()
    let tabBarItemAssembly = TabBarItemAssembly()
    
    func todayNoteViewController() -> TodayNoteViewController {
        let controller =  storyboardAssembly
            .mainStoryboard()
            .controller() as TodayNoteViewController
        controller.title = "TODAY"
        return controller
    }
    
    func todayNoteViewControllerTabModule() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: todayNoteViewController())
        navigation.tabBarItem = tabBarItemAssembly.todayNoteTabBarItem()
        return navigation
    }
}

