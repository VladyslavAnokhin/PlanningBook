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
                              self.todayModule.todayNoteViewController(),
                              self.addNoteModule.addNoteViewController(),
                              self.historyModule.historyViewController()
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
    
}
