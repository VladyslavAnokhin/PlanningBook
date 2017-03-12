//
//  Paging.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/11/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation


struct Paging {
    var limit: Int!
    var offset: Int!
    
    func next() -> Paging {
        return Paging(limit: limit, offset: limit + offset)
    }
}
