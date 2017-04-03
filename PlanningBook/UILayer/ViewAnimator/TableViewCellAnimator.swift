//
//  TableViewCellAnimator.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 4/3/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

protocol TableViewCellAnimator: ViewAnimatorProtocol {
    mutating func runAnimation(forTableView tablView: UITableView)
}
