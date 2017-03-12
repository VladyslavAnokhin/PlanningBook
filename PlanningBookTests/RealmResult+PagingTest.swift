//
//  RealmResult+PagingTest.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/12/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import XCTest
import RealmSwift

@testable import PlanningBook

class RealmResult_PagingTest: XCTestCase {
    
    var realm: Realm!
    var sut: Results<RealmNote>!
    
    override func setUp() {
        super.setUp()
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        realm = try! Realm()
        
        var notesArray = [RealmNote]()
        
        for i in 0..<100{
            let note = RealmNote()
            note.title = String(i)
            notesArray.append(note)
        }
        
        try! realm.write {
            realm.add(notesArray)
        }
        
        sut = realm.objects(RealmNote.self)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPaginationSameParts(){
        
        let firstPartPaging = Paging(limit: 50, offset: 0)
        let secondPartPaging = firstPartPaging.next()
        
        let firstPart = sut.models(withPaging: firstPartPaging)
        let secondPart = sut.models(withPaging: secondPartPaging)
        
        XCTAssert(firstPart.count == 50, "should be half of all objects")
        XCTAssert(secondPart.count == 50, "should be half of all objects")
        
        XCTAssert(firstPart.first!.title == "0")
        XCTAssert(firstPart.last!.title == "49")
        
        XCTAssert(secondPart.first!.title == "50")
        XCTAssert(secondPart.last!.title == "99")
    }
    
    func testPaginationDifferentParts(){
        
        let firstPartPaging = Paging(limit: 60, offset: 0)
        let secondPartPaging = firstPartPaging.next()
        
        let firstPart = sut.models(withPaging: firstPartPaging)
        let secondPart = sut.models(withPaging: secondPartPaging)
        
        XCTAssert(firstPart.count == 60)
        XCTAssert(secondPart.count == 40)
        
        XCTAssert(firstPart.first!.title == "0")
        XCTAssert(firstPart.last!.title == "59")
        
        XCTAssert(secondPart.first!.title == "60")
        XCTAssert(secondPart.last!.title == "99")
    }
    
    func testPagingOnePartWithSameLimit(){
        let firstPartPaging = Paging(limit: 100, offset: 0)
        let secondPartPaging = firstPartPaging.next()
        
        let firstPart = sut.models(withPaging: firstPartPaging)
        let secondPart = sut.models(withPaging: secondPartPaging)
        
        XCTAssert(firstPart.count == 100)
        XCTAssert(secondPart.count == 0)
        
        XCTAssert(firstPart.first!.title == "0")
        XCTAssert(firstPart.last!.title == "99")
    }
    
    func testPaginationOnePartWithBiggerLimit(){
        let firstPartPaging = Paging(limit: 120, offset: 0)
        let secondPartPaging = firstPartPaging.next()
        
        let firstPart = sut.models(withPaging: firstPartPaging)
        let secondPart = sut.models(withPaging: secondPartPaging)
        
        XCTAssert(firstPart.count == 100)
        XCTAssert(secondPart.count == 0)
        
        XCTAssert(firstPart.first!.title == "0")
        XCTAssert(firstPart.last!.title == "99")
        
    }
}
