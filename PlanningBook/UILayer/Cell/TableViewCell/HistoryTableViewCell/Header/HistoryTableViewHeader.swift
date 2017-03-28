//
//  HistoryTableViewHeader.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/28/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

class HistoryTableViewHeader: UITableViewHeaderFooterView, NibOwner, ReusableView {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    var model: HistoryTableViewHeaderModel!{
        didSet{
            dateLabel.text = model.sectionDateString
            dayLabel.text = model.weekDay
            
            contentView.backgroundColor = model.color
        }
    }
}
