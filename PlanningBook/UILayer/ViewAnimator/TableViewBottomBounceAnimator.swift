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
        let cells = tablView.visibleCells as [UIView]
        let headers = tablView.visibleSectionHeaders as [UIView]
        candidates = headers + cells
        
        run()
    }
    
    func beforeAnimation(){
        candidates.forEach{ cell in
            cell.transform = CGAffineTransform(translationX: 0, y: startYOffset)
        }
    }
    
}

