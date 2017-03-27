//
//  TableViewBottomBounceAnimator.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/27/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct TableViewBottomBounceAnimator: TableViewCellAnimator{

    var animationDuration: TimeInterval = 0.7
    var candidates: [UIView] = [UIView]()
    var startYOffset: CGFloat = 0

    mutating func runAnimation(forTableView tablView: UITableView){
        tablView.reloadData()
        startYOffset = tablView.frame.height
        candidates = tablView.visibleCells
        
        run()
    }
    
    func beforeAnimation(){
        candidates.forEach{cell in
            cell.transform = CGAffineTransform(translationX: cell.frame.origin.x, y: startYOffset)
        }
    }
    
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
