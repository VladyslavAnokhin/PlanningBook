//
//  Note.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import UIKit

struct DateRange {
    let start: Date
    let end: Date
}

class Note: NSObject {
    var title: String
    var body: String
    var category: Category
    var dateRange: DateRange
    
    init(title: String, body: String, category: Category, dateRange: DateRange){
        self.title = title
        self.body = body
        self.category = category
        self.dateRange = dateRange
    }
    
    convenience init(realmNote: RealmNote){
        let category = Category(name: "realmCatgory: realmNote.category")
        let dateRange = DateRange(start: realmNote.startDate!, end: realmNote.endDate!)
        self.init(title: realmNote.title, body: realmNote.body, category: category, dateRange: dateRange)
    }
}
