//
//  ControllersForTabBarAssembly.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct ControllersForTabBarAssembly {
    
    let todayModule = TodayModuleAssembly()
    let historyModule = HistoryModuleAssembly()
    let addNoteModule = AddNoteModuleAssembly()
    
    func viewControllers() -> [UINavigationController] {
        return [todayModule.todayNoteViewControllerTabModule(),
                addNoteModule.addNoteViewControllerTabModule(),
                historyModule.historyViewControllerTabModule()]
    }
    
}
