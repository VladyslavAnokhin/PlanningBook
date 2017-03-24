//
//  CategoryCollectionViewCellModel.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/23/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation

struct CategoryCollectionViewCellModel {
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    init(cagegoty: Category){
        self.name = cagegoty.name
    }
}
