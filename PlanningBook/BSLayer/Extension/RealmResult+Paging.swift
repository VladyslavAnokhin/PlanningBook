//
//  RealmResult+Paging.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/12/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    func models(withPaging paging: Paging) -> [T]{
        
        var newNotes = [T]()
        let offset = paging.offset
        let butchSize = paging.offset + paging.limit
        
        let lastIndex = self.count < butchSize ? self.count : butchSize
        
        for i in offset!..<lastIndex {
            let model = self[i]
            newNotes.append(model)
        }
        
        return newNotes
    }
    
}
