//
//  RealmNote.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/5/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift

class RealmNote: Object{
    var title: String? = nil
    var body: String? = nil
    
    var startDate: Date? = nil
    var endDate: Date? = nil

}
