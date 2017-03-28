//
//  ViewControllerAssembly.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/2/17.
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
            .instantiateViewController(withIdentifier: "HistoryNotesViewCotnroller") as! HistoryNotesViewCotnroller
        
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

struct TodayModuleAssembly {
    
    let storyboardAssembly = StoryboardAssebmly()
    let tabBarItemAssembly = TabBarItemAssembly()
    
    func todayNoteViewController() -> TodayNoteViewController {
        let controller =  storyboardAssembly
            .mainStoryboard()
            .instantiateViewController(withIdentifier: "TodayNoteViewController") as! TodayNoteViewController
        controller.title = "TODAY"
        return controller
    }
    
    func todayNoteViewControllerTabModule() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: todayNoteViewController())
        navigation.tabBarItem = tabBarItemAssembly.todayNoteTabBarItem()
        return navigation
    }
}

struct CategoryPickerModuleAssembly {
    
    let storyboardAssembly       = StoryboardAssebmly()
    let tabBarItemAssembly       = TabBarItemAssembly()
    let interactorAssembly       = RealmCategoryInteractorAssembly()
    let addNoteControllerFactory = AddNoteModuleAssembly()
    
    func categoryPickerViewController() -> SelectCategoryViewController{
        let controller = storyboardAssembly
            .mainStoryboard()
            .instantiateViewController(withIdentifier: "SelectCategoryViewController") as! SelectCategoryViewController
        controller.title = "CATEGORY"
        controller.interactor = interactorAssembly.categoryInteractor()
        controller.controllerFactory = addNoteControllerFactory
        
        return controller
    }
    
    func categoryPickerViewControllerTabModule() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: categoryPickerViewController())
        navigation.tabBarItem = tabBarItemAssembly.addNoteTabBarItem()
        
        return navigation
    }
}


struct DatePickerModuleAssembly  {
    
    let storyboardAssembly = StoryboardAssebmly()
    
    func datePickeriewController() -> DatePickerViewController {
        let controller =  storyboardAssembly
            .mainStoryboard()
            .instantiateViewController(withIdentifier: "DatePickerViewController") as! DatePickerViewController
        
        return controller
    }
}

struct AddNoteModuleAssembly  {
    
    let storyboardAssembly = StoryboardAssebmly()
    let interactorAssembly = RealmSaveNoteInteractorAssemlby()
    let datePickerAssembly = DatePickerModuleAssembly()
    
    func addNoteViewController() -> AddNoteViewController {
        let controller =  storyboardAssembly
            .mainStoryboard()
            .instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        
        controller.saveInteractor = interactorAssembly.saveNoteInteractor()
        controller.datePicker = datePickerAssembly.datePickeriewController()
        
        return controller
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
