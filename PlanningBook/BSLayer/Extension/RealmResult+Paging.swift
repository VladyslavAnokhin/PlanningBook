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
        let startIndex = paging.offset
        let packSize = paging.offset + paging.limit
        
        let lastIndex = self.count < packSize ? self.count : packSize
        
        guard startIndex! < count else {
            return newNotes
        }
        
        for i in startIndex!..<lastIndex {
            let model = self[i]
            newNotes.append(model)
        }
        
        return newNotes
    }
    
}
