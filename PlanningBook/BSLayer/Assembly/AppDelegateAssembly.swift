//
//  AppDelegateAssembly.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 2/28/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import Typhoon


class AppDelegateAssembly: TyphoonAssembly{
    
    var appConfigurator: TabBarAppConfiguratorAssembly!
    
    public dynamic func appDelegate() -> Any {
        return TyphoonDefinition.withClass(AppDelegate.self,
                                           configuration: { definition in
                                            definition?.injectProperty(#selector(getter: AppDelegate.appConfigurator),
                                                                       with: self.appConfigurator.firstControllerConfigurator())
        })
    }
    
}

class TabBarAppConfiguratorAssembly: TyphoonAssembly {
    
    var tabBarViewControllers: ControllersForTabBarAssembly!
    
    public dynamic func firstControllerConfigurator() -> Any {
        return TyphoonDefinition.withClass(TabBarAppConfigurator.self, configuration: { definition in
            definition?.injectProperty(#selector(getter: TabBarAppConfigurator.viewControllersForTabBar),
                                       with: self.tabBarViewControllers.viewControllers())
        })
    }
    
}





