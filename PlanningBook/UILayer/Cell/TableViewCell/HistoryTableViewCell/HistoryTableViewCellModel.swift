//
//  HistoryTableViewCellModel.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/6/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit
import AVFoundation

struct HistoryTableViewCellModel{
    var title: String?
    var category: String?
    var startDate: String?
    var endDate: String?
    
    init(note: Note, dataFormatter: DateFormatter){
        self.title = note.title
        self.category = note.category.name
        self.startDate = dataFormatter.string(from: note.dateRange.start)
        self.endDate = dataFormatter.string(from: note.dateRange.end)
    }
}
