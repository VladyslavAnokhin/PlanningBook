//
//  Note.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation

struct DateRange {
    let start: Date
    let end: Date
}

class Note: NSObject {
    var title: String
    var body: String
    
    var dateRange: DateRange
    
    init(title: String, body: String, dateRange: DateRange){
        self.title = title
        self.body = body
        self.dateRange = dateRange
    }
    
    convenience init(realmNote: RealmNote){
        let dateRange = DateRange(start: realmNote.startDate!, end: realmNote.endDate!)
        self.init(title: realmNote.title, body: realmNote.body, dateRange: dateRange)
    }
}
