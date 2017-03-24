//
//  CategoryCollectionViewCell.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/23/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell, NibOwner, ReusableView {

    @IBOutlet weak var categoryNameLabel: UILabel!

    var cellModel: CategoryCollectionViewCellModel!{
        didSet{
            categoryNameLabel.text = cellModel.name
        }
    }
}
