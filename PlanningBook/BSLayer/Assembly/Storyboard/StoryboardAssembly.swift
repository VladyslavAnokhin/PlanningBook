//
//  StoryboardAssembly.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/2/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import Typhoon


class StoryboardAssebmly: TyphoonAssembly{
    
    public dynamic func mainStoryboard() -> Any {
        return TyphoonDefinition.withClass(TyphoonStoryboard.self,
                                           configuration:{ definition in
            definition?.useInitializer(#selector(TyphoonStoryboard.init(name:factory:bundle:)),
                                       parameters: {initilizer in
                                        initilizer?.injectParameter(with: "Main")
                                        initilizer?.injectParameter(with: self)
                                        initilizer?.injectParameter(with: Bundle.main)
            })
        })
    }
    
}
