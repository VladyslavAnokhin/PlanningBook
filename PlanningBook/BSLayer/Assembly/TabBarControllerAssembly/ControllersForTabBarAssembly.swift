//
//  ControllersForTabBarAssembly.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import Typhoon

class ControllersForTabBarAssembly: TyphoonAssembly {
    
    var tabBarAssembly: TabBarItemAssembly!
    var todayModule: TodayModuleAssembly!
    var historyModule: HistoryModuleAssembly!
    var addNoteModule: AddNoteModuleAssembly!
    
    public dynamic func viewControllers() -> Any {
        return TyphoonDefinition.withClass(NSMutableArray.self, configuration: {definition in
            
            let tabsArray = [
                              self.todayNotesNavigation(),
                              self.addNoteNavigation(),
                              self.historyNavigation()
                            ]
            
            definition?.useInitializer(#selector(NSMutableArray.init(capacity:)),
                                       parameters: { (initializer) in
                                        initializer?.injectParameter(with: tabsArray.count)
            })
            
            definition?.injectMethod(#selector(NSMutableArray.addObjects(from:)),
                                     parameters: {typhoonMethod in
                                        typhoonMethod?.injectParameter(with: tabsArray)
            })
        })
    }
    
    public dynamic func todayNotesNavigation()-> Any {
        return navigation(withRoot: todayModule.todayNoteViewController(),
                          AndTabBarItem: tabBarAssembly.todayNoteTabBarItem())
    }
    
    public dynamic func addNoteNavigation() -> Any {
        return navigation(withRoot: addNoteModule.addNoteViewController(),
                          AndTabBarItem: tabBarAssembly.addNoteTabBarItem())
    }
    
    public dynamic func historyNavigation()-> Any {
        return navigation(withRoot: historyModule.historyViewController(),
                          AndTabBarItem: tabBarAssembly.historyTabBarItem())
    }
    
    public dynamic func navigation(withRoot root: Any, AndTabBarItem item: Any) -> Any {
        return TyphoonDefinition.withClass(UINavigationController.self,
                                           configuration: { (definition) in
                                            definition?.useInitializer(#selector(UINavigationController.init(rootViewController:)),
                                                                       parameters: { (initalizer) in
                                                                        initalizer?.injectParameter(with: root)
                                            })
                                            
        })
    }
    
}
