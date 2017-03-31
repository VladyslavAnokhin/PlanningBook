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
    var time: String?
    
    var color: UIColor
    
    init(){
        color = UIColor(white: 0.4, alpha: 1)
    }
    
    init( note: Note ){
        self.init()
        
        self.title = note.title
        self.category = note.category.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let start = dateFormatter.string(from: note.dateRange.start)
        let end   = dateFormatter.string(from: note.dateRange.end)
        
        time = start + " - " + end
    }
}
