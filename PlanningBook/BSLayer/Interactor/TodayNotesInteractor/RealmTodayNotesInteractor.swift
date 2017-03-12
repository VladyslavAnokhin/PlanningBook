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
    var todayStartDate: Date!
    var todayEndDate: Date!
    var paging: Paging!
    
    internal var result: Results<RealmNote>!
    
    override init(){
        super.init()
        let today = Date()
        service = FetchRealmNoteService()
        todayStartDate = today.startOfDay
        todayEndDate = today.endOfDay
        paging = Paging(limit: 50, offset: 0)
        result = service.fetchRealmNotes(withStartDateAfter: todayStartDate)
                        .fetchRealmNotes(withStartDateBefore: todayEndDate).result
    }
}

extension RealmTodayNotesInteractor: TodayNotesInteractorProtocol {
    func fetchTodayFeed(withCompletion completion: NoteArrayCompletion ){
        let notes = result
            .models(withPaging: paging)
            .map{Note(realmNote: $0)}
        completion(notes, nil)
    }
    
    func fetchNextOffset(withCompletion completion: NoteArrayCompletion ){
        paging = paging.next()
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
