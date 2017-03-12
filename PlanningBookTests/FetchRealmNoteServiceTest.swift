//
//  FetchRealmNoteServiceTest.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/12/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import XCTest
import RealmSwift

@testable import PlanningBook

class FetchRealmNoteServiceTest: XCTestCase {
    
    var sut: FetchRealmNoteServiceMock!
    var sutRealm: Realm!
    var dateArray: [Date]!
    
    var todayDateStart: Date!
    var todayDateEnd: Date!
    var yesterdayStart: Date!
    var yesterdayEnd: Date!
    var tomorrowStart: Date!
    var tomorrowEnd: Date!
    
    var todayNote: RealmNote {
        let todayNote = RealmNote()
        todayNote.startDate = todayDateStart
        todayNote.endDate = todayDateEnd
        return todayNote
    }
    
    var yesterdayNote: RealmNote {
        let yesterdayNote = RealmNote()
        yesterdayNote.startDate = yesterdayStart
        yesterdayNote.endDate = yesterdayEnd
        return yesterdayNote
    }
    
    var tomorrowNote: RealmNote {
        let tomorrowNote = RealmNote()
        tomorrowNote.startDate = tomorrowStart
        tomorrowNote.endDate = tomorrowEnd
        return tomorrowNote
    }
    
    func fillDates(){
        
        todayDateStart = Date(timeIntervalSince1970: 0)
        
        let calendar = Calendar(identifier: .gregorian)
        var components = Set<Calendar.Component>()
        components.insert(Calendar.Component.year)
        components.insert(Calendar.Component.month)
        components.insert(Calendar.Component.day)
        components.insert(Calendar.Component.hour)
        components.insert(Calendar.Component.minute)
        let todayComponents = calendar.dateComponents(components, from: todayDateStart)
        
        var todayEndComponents = todayComponents
        todayEndComponents.hour = todayComponents.hour! + 1
        todayDateEnd = calendar.date(from: todayEndComponents)
        
        var yesterdayStartComponents = todayComponents
        yesterdayStartComponents.day = todayComponents.day! - 1
        yesterdayStart = calendar.date(from: yesterdayStartComponents)
        
        var yesterdayEndComponents = todayComponents
        yesterdayEndComponents.day = todayComponents.day! - 1
        yesterdayEndComponents.hour = todayComponents.hour! + 1
        yesterdayEnd = calendar.date(from: yesterdayEndComponents)
        
        var tomorrowStartComponents = todayComponents
        tomorrowStartComponents.day = todayComponents.day! + 1
        tomorrowStart = calendar.date(from: tomorrowStartComponents)
        
        var tomorrowEndComponents = todayComponents
        tomorrowEndComponents.day = todayComponents.day! + 1
        tomorrowEndComponents.hour = todayComponents.hour! + 1
        tomorrowEnd = calendar.date(from: tomorrowEndComponents)
    }
    
    override func setUp() {
        super.setUp()
        
        sut = FetchRealmNoteServiceMock()
        sutRealm = sut.realm
        fillDates()
        
        try! sutRealm.write {
            sutRealm.add(yesterdayNote)
            sutRealm.add(todayNote)
            sutRealm.add(tomorrowNote)
        }
    }
    
    override func tearDown() {
        super.tearDown()
        
       try! sutRealm.write{
            sutRealm.deleteAll()
        }
        
        sutRealm = nil
    }
    
    
    func testFetchAllNotesTest(){
        let notes = sut.fetchAllRealmNotes()
        
        XCTAssert(notes?.count == 3, "we added 3 notes")
    }
    
    func testFetchBeforeStartDate(){
        let notes = sut.fetchRealmNotes(withStartDateBefore: todayDateStart)
        
        XCTAssertNotNil(notes)
        XCTAssert(notes!.count == 1)
    }
    
    func testFetchNotesWithRangeWithIncluding(){
        let dateRangeAllNotes = DateRange(start: yesterdayStart, end: tomorrowEnd)
        
        let allNotes = sut.fetchRealmNotes(withDateRange: dateRangeAllNotes, shouldIncludeRange: true)
        
        XCTAssertNotNil(allNotes)
        XCTAssert(allNotes!.count == 3)
    }
    
    func fetchTodayNotes(){
        let todayRange = DateRange(start: yesterdayStart, end: tomorrowEnd)
        
        let todayNote = sut.fetchRealmNotes(withDateRange: todayRange, shouldIncludeRange: false)
        
        XCTAssertNotNil(todayNote)
        XCTAssert(todayNote!.count == 1)
    }
}

internal class FetchRealmNoteServiceMock: FetchRealmNoteService{
    
    override init(){
        super.init()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "FetchRealmNoteServiceMock"))
    }
    
}
