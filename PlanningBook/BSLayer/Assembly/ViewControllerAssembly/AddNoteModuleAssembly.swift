//
//  AddNoteModuleAssembly.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/30/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct AddNoteModuleAssembly  {
    
    let storyboardAssembly = StoryboardAssebmly()
    let interactorAssembly = RealmSaveNoteInteractorAssemlby()
    let datePickerAssembly = DatePickerModuleAssembly()
    
    func addNoteViewController() -> AddNoteViewController {
        let controller =  storyboardAssembly
            .mainStoryboard()
            .controller() as AddNoteViewController
        
        controller.saveInteractor = interactorAssembly.saveNoteInteractor()
        controller.datePicker = datePickerAssembly.datePickeriewController()
        
        return controller
    }
}
