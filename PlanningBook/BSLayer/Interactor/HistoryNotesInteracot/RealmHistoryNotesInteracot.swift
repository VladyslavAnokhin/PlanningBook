//
//  RealmHistoryNotesInteracot.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/12/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift


class RealmHistoryNotesInteracot: NSObject {
    var realm: Realm?
    var paging: Paging!
    var today = Date()
    
    internal func historyNotes() -> Results<RealmNote>?{
        if realm == nil {
            realm = try! Realm()
        }
        
        return realm?.objects(RealmNote.self)
            .filter("endDate < %@", today)
            .sorted(byKeyPath: "startDate", ascending: false)
    }
    
    internal func butchArray() -> [Note]{
        if let notes = historyNotes(){
            
            var newNotes = [Note]()
            let offset = paging.offset
            let butchSize = paging.offset+paging.limit
            
            let lastIndex = notes.count < butchSize ? notes.count : butchSize
            
            for i in offset!..<lastIndex {
                let realmNote = notes[i]
                let newNote = Note(realmNote: realmNote)
                newNotes.append(newNote)
            }
            
            return newNotes
        }
        
        return [Note]()
    }
}

extension RealmHistoryNotesInteracot: HistoryNotesInteracotProtocol{
    func fetchHistoryFeed(withCompletion completion: ([Note]?, NSError?)->() ){
        paging = Paging(limit: 50, offset: 0)
        let notes = butchArray()
        completion(notes, nil)
    }
    
    func fetchNextOffset(withCompletion completion: ([Note]?, NSError?)->() ){
        paging.offset = paging.offset + paging.limit
        let notes = butchArray()
        completion(notes, nil)
    }
}
