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
    let numberOfNotes: Int
    
    init(name: String, numberOfNotes: Int){
        self.name = name
        self.numberOfNotes = numberOfNotes
    }
    
    init(realmCategory: RealmCategory){
        self.init(name: realmCategory.name, numberOfNotes: realmCategory.numberOfNotes)
    }
}
