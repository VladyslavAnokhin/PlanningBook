//
//  RealmNote.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/5/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import RealmSwift

class RealmCategory: Object {
    dynamic var name: String = ""
}

class RealmNote: Object{
    dynamic var title: String = ""
    dynamic var body: String = ""
    dynamic var category: RealmCategory!
    dynamic var startDate: Date? = nil
    dynamic var endDate: Date? = nil

}
