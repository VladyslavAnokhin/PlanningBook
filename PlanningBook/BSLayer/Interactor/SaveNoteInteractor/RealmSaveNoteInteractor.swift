//
//  SaveNoteInteractor.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/5/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift


class RealmSaveNoteInteractor {
    var saveNoteService: SaveRealmNoteService!
    
    init(){
        saveNoteService = SaveRealmNoteService()
    }
}

extension RealmSaveNoteInteractor: SaveNoteInteractorProtocol {
    
    func saveNote(note: Note, withCompletion completion: BoolCompletion ) {
        saveNoteService.save(singleNote: note, completion: completion)
    }
    
}
