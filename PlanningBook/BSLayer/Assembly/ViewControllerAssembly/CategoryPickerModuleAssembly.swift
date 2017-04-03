//
//  CategoryPickerModuleAssembly.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/30/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct CategoryPickerModuleAssembly {
    
    let storyboardAssembly       = StoryboardAssebmly()
    let tabBarItemAssembly       = TabBarItemAssembly()
    let interactorAssembly       = RealmCategoryInteractorAssembly()
    let addNoteControllerFactory = AddNoteModuleAssembly()
    let animatorAssembly         = LeftRightViewAnimatorAssembly()
    
    func categoryPickerViewController() -> SelectCategoryViewController{
        let controller = storyboardAssembly
            .mainStoryboard()
             .controller() as SelectCategoryViewController
        controller.title = "CATEGORY"
        controller.interactor = interactorAssembly.categoryInteractor()
        controller.controllerFactory = addNoteControllerFactory
        controller.cellAnimator = animatorAssembly.animator()
        
        return controller
    }
    
    func categoryPickerViewControllerTabModule() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: categoryPickerViewController())
        navigation.tabBarItem = tabBarItemAssembly.addNoteTabBarItem()
        
        return navigation
    }
}
