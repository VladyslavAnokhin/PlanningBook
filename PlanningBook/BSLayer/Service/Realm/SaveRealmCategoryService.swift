//
//  SaveRealmCategoryService.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/24/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift

class SaveRealmCategoryService{
    
    var realm: Realm!
    
    init(){
        realm = try! Realm()
    }
    
    func save(newCategory category: Category, completion: BoolCompletion ){
        
        let realmCategory = RealmCategory()
        realmCategory.name = category.name
        
        do {
            try realm?.write {
                realm?.add(realmCategory)
                completion(true, nil)
            }
        } catch let error {
            completion(false, error as NSError?)
        }
        
    }
    
}
