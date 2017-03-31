//
//  HistoryTableViewCell.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/6/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var timeLable: UILabel!
    
    @IBOutlet weak var placeholderView: UIView!
    
    var cellModel: HistoryTableViewCellModel!{
        didSet{
            titleLabel.text = cellModel.title
            categoryLabel.text = cellModel.category
            timeLable.text = cellModel.time
            backgroundColor = .clear
            placeholderView.backgroundColor = cellModel.color
        }
    }
}
