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
    
    var tabBarAssembly: TabBarControllerAssembly!
    
    public dynamic func appDelegate() -> Any {
        return TyphoonDefinition.withClass(AppDelegate.self,
                                           configuration: { definition in
                                            definition?.injectProperty(#selector(self.tabBarAssembly.tabBarController))
        })
    }
    
}






