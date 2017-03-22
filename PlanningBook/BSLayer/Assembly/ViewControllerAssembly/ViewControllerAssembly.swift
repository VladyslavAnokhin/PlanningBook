//
//  ViewControllerAssembly.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/2/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct HistoryModuleAssembly {
    
    let storyboardAssembly = StoryboardAssebmly()
    let tabBarAssembly = TabBarItemAssembly()
    let emptyTableViewAssembly = EmptyTableViewDelegateAssembly()
    
     func historyViewController() -> HistoryNotesViewCotnroller {
        let controller =  storyboardAssembly
            .mainStoryboard()
            .instantiateViewController(withIdentifier: "HistoryNotesViewCotnroller") as! HistoryNotesViewCotnroller
        
        controller.emptyDelagateDataSource = emptyTableViewAssembly.historyEmptyViewDelegate()
        
        return controller
    }
    
    func historyViewControllerTabModule() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: historyViewController())
        navigation.tabBarItem = tabBarAssembly.historyTabBarItem()
        
        return navigation
    }

}

struct TodayModuleAssembly {
    
    let storyboardAssembly = StoryboardAssebmly()
    let tabBarAssembly = TabBarItemAssembly()
    
    func todayNoteViewController() -> TodayNoteViewController {
        let controller =  storyboardAssembly
            .mainStoryboard()
            .instantiateViewController(withIdentifier: "TodayNoteViewController") as! TodayNoteViewController
        
        return controller
    }
    
    func todayNoteViewControllerTabModule() -> UINavigationController {
            let navigation = UINavigationController(rootViewController: todayNoteViewController())
            navigation.tabBarItem = tabBarAssembly.todayNoteTabBarItem()
            
            return navigation
    }
}

struct AddNoteModuleAssembly  {
    
    let storyboardAssembly = StoryboardAssebmly()
    let saveInteractor = SaveNoteInteractorAssemlby()
    let tabBarAssembly = TabBarItemAssembly()
    
    func addNoteViewController() -> AddNoteViewController {
        let controller =  storyboardAssembly
            .mainStoryboard()
            .instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        
        controller.saveInteractor = saveInteractor.realmSaveNoteInteractor()
        
        return controller
    }
    
    func addNoteViewControllerTabModule() -> UINavigationController {
            let navigation = UINavigationController(rootViewController: addNoteViewController())
            navigation.tabBarItem = tabBarAssembly.addNoteTabBarItem()
            return navigation
    }
}

struct EmptyTableViewDelegateAssembly {
    
    func todayPlansEmptyViewDelegate() -> EmptyViewDataSourceDelegate {
        return EmptyViewDataSourceDelegate(title: "Today you haven't any plans", buttonTitle: "Add plans!")
    }
    
    func historyEmptyViewDelegate() -> EmptyViewDataSourceDelegate {
         return EmptyViewDataSourceDelegate(title: "You don't add any plans", buttonTitle: "Create new one")
    }
    
}
