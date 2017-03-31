//
//  SaveRealmNoteService.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/21/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift

class SaveRealmNoteService {
    
    var realm: Realm!
    
    func save(singleNote note: Note, completion: BoolCompletion){
        
        let realmNote = RealmNote()
        realmNote.title = note.title
        realmNote.body = note.body
        
        // end can't be less than start
        realmNote.startDate = note.dateRange.start
        realmNote.endDate = note.dateRange.end
        
        let realmCategory = RealmCategory()
        realmCategory.name = note.category.name
        realmCategory.numberOfNotes = note.category.numberOfNotes + 1
        
        realmNote.category = realmCategory
        
        if realm == nil {
            realm = try! Realm()
        }
        
        do {
            try realm?.write {
                realm?.add(realmNote)
                completion(true, nil)
            }
        } catch let error {
            completion(false, error as NSError?)
        }
    }
    
    func save(arrayOfNotes notes: [Note], completion: BoolCompletion){
        
    }
    
}
