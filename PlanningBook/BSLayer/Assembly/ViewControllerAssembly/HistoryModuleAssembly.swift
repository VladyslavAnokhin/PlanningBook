//
//  HistoryModuleAssembly.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/30/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct HistoryModuleAssembly {
    
    let storyboardAssembly     = StoryboardAssebmly()
    let tabBarItemAssembly     = TabBarItemAssembly()
    let emptyTableViewAssembly = EmptyTableViewDelegateAssembly()
    let interactorAssembly     = RealmHistoryNotesInteracotAssembly()
    let cellAnimatorAssembly   = TableViewBottomBounceAnimatorAssembly()
    
    
    func historyViewController() -> HistoryNotesViewCotnroller {
        let controller =  storyboardAssembly
            .mainStoryboard()
            .controller() as HistoryNotesViewCotnroller
        
        controller.title = "HISTORY"
        controller.emptyDelagateDataSource = emptyTableViewAssembly.historyEmptyViewDelegate()
        controller.interactor = interactorAssembly.historyInteractor()
        controller.tableViewAnimator = cellAnimatorAssembly.animator()
        
        return controller
    }
    
    func historyViewControllerTabModule() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: historyViewController())
        navigation.tabBarItem = tabBarItemAssembly.historyTabBarItem()
        
        return navigation
    }
    
}
