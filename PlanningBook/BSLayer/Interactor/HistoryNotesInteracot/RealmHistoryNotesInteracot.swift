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
    var service: FetchRealmNoteService!
    var today: Date!
    
    internal var paging: Paging!
    internal var result: Results<RealmNote>!
    
    override init(){
        super.init()
        service = FetchRealmNoteService()
        today = Date().startOfDay
        result = service
            .fetchRealmNotes(withEndDateBefore: today)
            .result
    }
}

extension RealmHistoryNotesInteracot: HistoryNotesInteracotProtocol{
    func fetchHistoryFeed(withCompletion completion: NoteArrayCompletion ){
        paging = Paging(limit: 50, offset: 0)
        
        let realmNotes = result
            .models(withPaging: paging)
            .map{ Note(realmNote: $0) }
        
        completion(realmNotes, nil)
    }
    
    func fetchNextOffset(withCompletion completion: NoteArrayCompletion ){
        paging = paging.next()
        
        let realmNotes = result
            .models(withPaging: paging)
            .map{ Note(realmNote: $0) }
        
        completion(realmNotes, nil)
    }
}
