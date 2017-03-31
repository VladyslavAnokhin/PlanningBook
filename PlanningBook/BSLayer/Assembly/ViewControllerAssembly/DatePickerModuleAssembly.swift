//
//  DatePickerModuleAssembly.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/30/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct DatePickerModuleAssembly  {
    
    let storyboardAssembly = StoryboardAssebmly()
    
    func datePickeriewController() -> DatePickerViewController {
        let controller =  storyboardAssembly
            .mainStoryboard()
            .controller() as DatePickerViewController
        
        
        return controller
    }
}
