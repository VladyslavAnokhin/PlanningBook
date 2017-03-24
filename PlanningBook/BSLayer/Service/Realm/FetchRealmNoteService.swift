//
//  FetchRealmNoteService.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/12/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift

class FetchRealmNoteService {
    
    var realm: Realm!
    var result: Results<RealmNote>!
    
    init(){
        self.realm = try! Realm()
    }
    
    
    func fetchAllRealmNotes() -> FetchRealmNoteService{
        let newService = FetchRealmNoteService()
        newService.result = realm.objects(RealmNote.self)
        return newService
    }
    
    func fetchRealmNotes(withStartDateBefore beforeDate: Date) -> FetchRealmNoteService{
        if result == nil {
            result = fetchAllRealmNotes().result
        }
        
        let newService = FetchRealmNoteService()
        newService.result =  result
            .filter("startDate < %@", beforeDate)
            .sorted(byKeyPath: "startDate", ascending: false)
        return newService
    }
    
    func fetchRealmNotes(withStartDateAfter afterDate: Date) -> FetchRealmNoteService{
        if result == nil {
            result = fetchAllRealmNotes().result
        }
        
        let newService = FetchRealmNoteService()
        newService.result =  result
            .filter("startDate > %@", afterDate)
            .sorted(byKeyPath: "startDate", ascending: false)
        return newService
    }
    
    func fetchRealmNotes(withEndDateBefore beforeDate: Date) -> FetchRealmNoteService{
        if result == nil {
            result = fetchAllRealmNotes().result
        }
        
        let newService = FetchRealmNoteService()
        newService.result =  result
            .filter("endDate < %@", beforeDate)
            .sorted(byKeyPath: "startDate", ascending: false)
        return newService
    }
    
    func fetchRealmNotes(withEndDateAfter afterDate: Date) -> FetchRealmNoteService{
        if result == nil {
            result = fetchAllRealmNotes().result
        }
        
        let newService = FetchRealmNoteService()
        newService.result =  result
            .filter("endDate > %@", afterDate)
            .sorted(byKeyPath: "startDate", ascending: false)
        return newService
    }
    
}
