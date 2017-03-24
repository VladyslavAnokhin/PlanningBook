//
//  Category.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/23/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation

struct Category {
    let name: String
    
    init(name: String){
        self.name = name
    }
    
    init(realmCategory: RealmCategory){
        self.init(name: realmCategory.name)
    }
}
