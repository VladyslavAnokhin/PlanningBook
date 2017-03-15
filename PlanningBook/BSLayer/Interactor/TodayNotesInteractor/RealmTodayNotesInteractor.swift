//
//  TodayNotesInteractor.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/12/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift

class RealmTodayNotesInteractor: NSObject {
    var service: FetchRealmNoteService!
    internal var result: Results<RealmNote>!
    
    override init(){
        super.init()
        service = FetchRealmNoteService()
    }
}

extension RealmTodayNotesInteractor: DayNotesInteractorProtocol {
    func fetchNotes(forDay date: Date, withCompletion completion: NoteArrayCompletion ){
        result = service.fetchRealmNotes(withStartDateAfter: date.startOfDay)
                        .fetchRealmNotes(withStartDateBefore: date.endOfDay!).result
        
        let paging = Paging(limit: result.count, offset: 0)
        let notes = result
                   .models(withPaging: paging)
                   .map{Note(realmNote: $0)}
        
        completion(notes, nil)
    }
}


extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date? {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)
    }
}
