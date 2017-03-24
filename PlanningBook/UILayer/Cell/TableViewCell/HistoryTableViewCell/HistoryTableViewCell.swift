//
//  HistoryTableViewCell.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/6/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell, NibOwner, ReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    var cellModel: HistoryTableViewCellModel!{
        didSet{
            titleLabel.text = cellModel.title
            startDateLabel.text = "Start at  " + cellModel.startDate!
            endDateLabel.text = "End at  " + cellModel.endDate!
            categoryLabel.text = cellModel.category
        }
    }
}
