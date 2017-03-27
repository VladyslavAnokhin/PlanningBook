//
//  HistoryTableViewModel.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/27/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct HistoryTableViewSectionModel{
    var header: HistoryTableViewHeaderModel?
    var cells: [HistoryTableViewCellModel]
}

struct HistoryTableViewModel {
    var sections: [HistoryTableViewSectionModel]
    
    init(){
        sections = [HistoryTableViewSectionModel]()
    }
    
    init(notes: [Note]){
        
        sections = [HistoryTableViewSectionModel]()
        
        let calendar = Calendar(identifier: .gregorian)
        var components = Set<Calendar.Component>()
        components.insert(Calendar.Component.year)
        components.insert(Calendar.Component.month)
        components.insert(Calendar.Component.day)
        
        var notesDictionary: [DateComponents: [Note]] = [DateComponents: [Note]]()
        
        notes.forEach { note in
            let noteDateConponents = calendar.dateComponents(components, from: note.dateRange.start)
            if notesDictionary[noteDateConponents] != nil {
                notesDictionary[noteDateConponents]!.append(note)
            } else {
                notesDictionary[noteDateConponents] = [note]
            }
        }
        
        let sortedKeys = notesDictionary.keys.sorted { (first, second) -> Bool in
            return  first.year!  < second.year! &&
                first.month! < second.month! &&
                first.day!   < first.day!
        }
        
        sortedKeys.forEach{ key in
            let sectionNotes = notesDictionary[key]!
            let headerTitle = String(key.month!)+" "+String(key.day!)+" "+String(key.year!)
            var cells = [HistoryTableViewCellModel]()
            
            sectionNotes.forEach({ (note) in
                cells.append(HistoryTableViewCellModel(note: note))
            })
            
            let section = HistoryTableViewSectionModel(header: HistoryTableViewHeaderModel(title: headerTitle),
                                                       cells: cells)
            self.sections.append(section)
        }
        
    }
}
