//
//  CategoryCollectionViewCell.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/23/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var numberOfNotesLabel: UILabel!

    var cellModel: CategoryCollectionViewCellModel!{
        didSet{
            categoryNameLabel.text = cellModel.name
            numberOfNotesLabel.text = cellModel.numberOfNotes
            backgroundColor = cellModel.color
        }
    }
}
