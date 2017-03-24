//
//  CategoryInteractorProtocol.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/24/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation

protocol CategoryInteractorProtocol{
    
    func fetch(allCategories completion: CategoryArrayCompletion )
    
    func save(newCategory category: Category, completion: BoolCompletion)
}
