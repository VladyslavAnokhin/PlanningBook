//
//  RealmCategoryInteractor.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/24/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift

class RealmCategoryInteractor {
    
    var fetchService: FetchRealmCategoriesService!
    var saveService: SaveRealmCategoryService!
    
    
    init(){
        fetchService = FetchRealmCategoriesService()
        saveService = SaveRealmCategoryService()
    }
    
}

extension RealmCategoryInteractor: CategoryInteractorProtocol{
    func fetch(allCategories completion: ([Category]?, NSError?) -> ()) {
        fetchService.fetchCategories(completion: completion)
    }
    
    func save(newCategory category: Category, completion: (Bool, NSError?) -> ()) {
        saveService.save(newCategory: category, completion: completion)
    }
}
