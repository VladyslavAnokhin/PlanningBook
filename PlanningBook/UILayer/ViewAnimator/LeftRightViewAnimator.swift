//
//  LeftRightViewAnimator.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 4/3/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct LeftRightViewAnimator: ViewAnimatorProtocol{
    
    var animationDuration: TimeInterval = 0.7
    var candidates: [UIView] = [UIView]()
    
    func beforeAnimation(){
        var index = 0
        candidates.forEach{ view in
            let width = view.bounds.width
            
            if index % 2 == 0 {
                view.transform = CGAffineTransform(translationX: -width, y: 0)
            } else {
                view.transform = CGAffineTransform(translationX: width, y: 0)
            }
            
            index += 1
        }
    }
}
