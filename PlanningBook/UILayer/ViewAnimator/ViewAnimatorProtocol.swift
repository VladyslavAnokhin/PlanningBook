//
//  ViewAnimator.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/27/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

protocol ViewAnimatorProtocol {
    var animationDuration: TimeInterval {get set}
    var candidates: [UIView]{ get set }
    
    func beforeAnimation()
    func animation()
    func run()
}

extension ViewAnimatorProtocol{
    func run(){
        beforeAnimation()
        animation()
    }
}


protocol TableViewCellAnimator: ViewAnimatorProtocol {
   mutating func runAnimation(forTableView tablView: UITableView)
}
