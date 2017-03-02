//
//  TabBarControllerAssembly.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import Typhoon

class TabBarControllerAssembly: TyphoonAssembly {
    
    var controllersAssembly: ControllersForTabBarAssembly!
    
    public dynamic func tabBarController() -> Any {
        return TyphoonDefinition.withClass(TabBarController.self,
                                           configuration: { definition  in
                                            definition?.injectProperty(#selector(getter: TabBarController.viewControllers),
                                                                       with: self.controllersAssembly.viewControllers())
                                            
        })
    }
}
