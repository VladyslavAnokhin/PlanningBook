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

        
    }
    
}
