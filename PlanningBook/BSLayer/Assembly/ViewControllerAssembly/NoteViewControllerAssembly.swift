//
//  NoteViewControllerAssembly.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/30/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct NoteViewControllerAssembly {
    
     let storyboardAssembly = StoryboardAssebmly()
    
    func noteViewController() -> NoteViewController{
        let controller = storyboardAssembly
                            .mainStoryboard()
                            .controller() as NoteViewController
        
        return controller
    }
}
