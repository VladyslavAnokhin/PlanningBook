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
        
        controller.title = "HISTORY"
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
        controller.title = "TODAY"
        return controller
    }
    
    func todayNoteViewControllerTabModule() -> UINavigationController {
            let navigation = UINavigationController(rootViewController: todayNoteViewController())
            navigation.tabBarItem = tabBarAssembly.todayNoteTabBarItem()
            return navigation
    }
}

struct CategoryPickerModuleAssembly {
    let storyboardAssembly = StoryboardAssebmly()
    let tabBarAssembly = TabBarItemAssembly()
    let categoryInteractor = CategoryInteractorAssembly()
    let addNoteControllerFactory = AddNoteModuleAssembly()
    
    func categoryPickerViewController() -> SelectCategoryViewController{
        let controller = storyboardAssembly
            .mainStoryboard()
            .instantiateViewController(withIdentifier: "SelectCategoryViewController") as! SelectCategoryViewController
        controller.title = "CATEGORY"
        controller.interactor = categoryInteractor.realmCategoryInteractor()
        controller.controllerFactory = addNoteControllerFactory
        
        return controller
    }
    
    func categoryPickerViewControllerTabModule() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: categoryPickerViewController())
        navigation.tabBarItem = tabBarAssembly.addNoteTabBarItem()
        
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
    let saveInteractor = SaveNoteInteractorAssemlby()
    let datePicker = DatePickerModuleAssembly()
    
    func addNoteViewController() -> AddNoteViewController {
        let controller =  storyboardAssembly
            .mainStoryboard()
            .instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        
        controller.saveInteractor = saveInteractor.realmSaveNoteInteractor()
        controller.datePicker = datePicker.datePickeriewController()
        
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
