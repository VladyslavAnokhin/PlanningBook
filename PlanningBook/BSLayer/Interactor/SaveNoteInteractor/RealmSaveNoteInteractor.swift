//
//  SaveNoteInteractor.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/5/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift


class RealmSaveNoteInteractor: NSObject{
    var realm: Realm?
}

extension RealmSaveNoteInteractor: SaveNoteInteractorProtocol {
    
    func saveNote(note: Note, withCompletion completion: BoolCompletion ) {
        let realmNote = RealmNote()
        realmNote.title = note.title
        realmNote.body = note.body
        realmNote.startDate = note.dateRange.start
        realmNote.endDate = note.dateRange.end
        
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
    
}
