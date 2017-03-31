//
//  RealmCategory.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/23/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift

class RealmCategory: Object {
    dynamic var name: String = ""
    dynamic var numberOfNotes: Int = 0
}
