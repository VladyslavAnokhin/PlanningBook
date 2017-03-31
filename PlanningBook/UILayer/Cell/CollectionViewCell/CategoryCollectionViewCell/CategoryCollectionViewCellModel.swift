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
    var numberOfNotes: String
    
    init(name: String, numberOfNotes: String){
        self.name = name
        self.numberOfNotes = numberOfNotes
    }
    
    init(category: Category){
        self.name = category.name
        self.numberOfNotes = String( category.numberOfNotes )
    }
}
