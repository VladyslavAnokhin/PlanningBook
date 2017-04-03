//
//  CategoryCollectionViewCellModel.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/23/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct CategoryCollectionViewCellModel {
    var name: String
    var numberOfNotes: String
    
    var color: UIColor
    
    init(name: String, numberOfNotes: String){
        self.color = UIColor(white: 0.7, alpha: 1)
        self.name = name
        self.numberOfNotes = numberOfNotes
    }
    
    init(category: Category){
        self.init(name: category.name, numberOfNotes: String( category.numberOfNotes ))
    }
}
