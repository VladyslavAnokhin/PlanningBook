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

struct Category {
    let name: String
    
    init(name: String){
        self.name = name
    }
    
    init(realmCatgory: RealmCategory){
        self.init(name: realmCatgory.name)
    }
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
        let category = Category(realmCatgory: realmNote.category)
        let dateRange = DateRange(start: realmNote.startDate!, end: realmNote.endDate!)
        self.init(title: realmNote.title, body: realmNote.body, category: category, dateRange: dateRange)
    }
}
