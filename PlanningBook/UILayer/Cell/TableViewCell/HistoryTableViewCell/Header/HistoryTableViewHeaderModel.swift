//
//  File.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/27/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct HistoryTableViewHeaderModel {
    var sectionDateString: String?
    var weekDay: String?
    
    var color: UIColor
    
    init(){
        color = UIColor(white: 0.3, alpha: 1)
    }
    
    init(date: Date){
        self.init()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, dd yyyy"
        sectionDateString = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "EEEE"
        weekDay = dateFormatter.string(from: date).uppercased()
    }
}
