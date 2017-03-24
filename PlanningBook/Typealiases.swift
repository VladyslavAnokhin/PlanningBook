//
//  Typealiases.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/24/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation


typealias CategoryArrayCompletion = ([Category]?, NSError?) -> ()
typealias NoteArrayCompletion = ([Note]?, NSError?)->()
typealias BoolCompletion = ((_ success: Bool, _ error: NSError?)->())

typealias DateBlock =  (Date)->()
typealias VoidBlock = ()->()
