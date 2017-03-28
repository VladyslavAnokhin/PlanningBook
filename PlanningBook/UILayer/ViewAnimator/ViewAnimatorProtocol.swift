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

extension TableViewCellAnimator{
     func animation() {
        var delay: CGFloat = 0
        candidates.forEach { (cell) in
            UIView.animate(withDuration: animationDuration,
                           delay: TimeInterval(delay),
                           usingSpringWithDamping: 0.75,
                           initialSpringVelocity: 0.85,
                           options: [],
                           animations: {
                            cell.transform = .identity
            },
                           completion: nil)
            
            delay += 0.05
        }
    }
}
