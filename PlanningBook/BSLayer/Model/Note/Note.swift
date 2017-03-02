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

struct Note {
    var title: String
    var description: String
    
    var dataRange: DataRange
}
