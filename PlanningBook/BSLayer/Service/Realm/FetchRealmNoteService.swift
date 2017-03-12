//
//  FetchRealmNoteService.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/12/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift

class FetchRealmNoteService: NSObject {
    
    var realm: Realm!
    
    override init(){
        super.init()
        self.realm = try! Realm()
    }
    
    func fetchAllRealmNotes() -> Results<RealmNote>?{
        return realm.objects(RealmNote.self)
    }
    
    func fetchRealmNotes(withStartDateBefore beforeDate: Date) -> Results<RealmNote>?{
        return fetchAllRealmNotes()?
            .filter("startDate < %@", beforeDate)
            .sorted(byKeyPath: "startDate", ascending: false)
    }
    
    func fetchRealmNotes(withStartDateAfter afterDate: Date) -> Results<RealmNote>?{
        return fetchAllRealmNotes()?
            .filter("startDate > %@", afterDate)
            .sorted(byKeyPath: "startDate", ascending: false)
    }
    
    func fetchRealmNotes(withEndDateBefore beforeDate: Date) -> Results<RealmNote>?{
        return fetchAllRealmNotes()?
            .filter("endDate < %@", beforeDate)
            .sorted(byKeyPath: "startDate", ascending: false)
    }
    
    func fetchRealmNotes(withEndDateAfter afterDate: Date) -> Results<RealmNote>?{
        return fetchAllRealmNotes()?
            .filter("endDate > %@", afterDate)
            .sorted(byKeyPath: "startDate", ascending: false)
    }
    
    func fetchRealmNotes(withDateRange dateRange: DateRange,
                         shouldIncludeRange shouldInclude: Bool) -> Results<RealmNote>?{
        let equalOrSpace = shouldInclude ? "=" : ""
        let predicateString = "startDate >"+equalOrSpace+" %@ AND endDate <"+equalOrSpace+" %@"
        return fetchAllRealmNotes()?
            .filter(predicateString, dateRange.start, dateRange.end)
            .sorted(byKeyPath: "startDate", ascending: false)
    }
    
}
