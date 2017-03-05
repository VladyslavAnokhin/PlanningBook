//
//  Note.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation

struct DataRange {
    let start: Date
    let end: Date
}

class Note: NSObject {
    var title: String
    var body: String
    
    var dataRange: DataRange
    
    init(title: String, body: String, dateRange: DataRange){
        self.title = title
        self.body = body
        self.dataRange = dateRange
    }
}
