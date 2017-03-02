//
//  TabBarItemAssembly.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import Typhoon


class TabBarItemAssembly: TyphoonAssembly{
    
    public dynamic func todayNoteTabBarItem() -> Any {
        return TyphoonDefinition.withClass(UITabBarItem.self,
                                           configuration: { (definition) in
                                            definition?.useInitializer(#selector(UITabBarItem.init(title:image:selectedImage:)),
                                                                       parameters: { (method) in
                                                                        method?.injectParameter(with: "Today")
                                                                        method?.injectParameter(with: nil)
                                                                        method?.injectParameter(with: nil)
                                            })
        })
    }
    
    public dynamic func historyTabBarItem() -> Any {
        return TyphoonDefinition.withClass(UITabBarItem.self,
                                           configuration: { (definition) in
                                            definition?.useInitializer(#selector(UITabBarItem.init(title:image:selectedImage:)),
                                                                       parameters: { (method) in
                                                                        method?.injectParameter(with: "History")
                                                                        method?.injectParameter(with: nil)
                                                                        method?.injectParameter(with: nil)
                                            })
        })
    }
    
}
