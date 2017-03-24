//
//  FetchRealmCategories.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/24/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift

class FetchRealmCategoriesService{
    
    var realm: Realm!
    
    init(){
        realm = try! Realm()
    }
    
    func fetchCategories(completion: CategoryArrayCompletion){
        let result = realm.objects(RealmCategory.self)
        let pagination = Paging(limit: result.count, offset: 0)
        let categories = result
            .models(withPaging: pagination)
            .map {Category(realmCategory: $0) }
        
        completion(categories, nil)
    }
}
