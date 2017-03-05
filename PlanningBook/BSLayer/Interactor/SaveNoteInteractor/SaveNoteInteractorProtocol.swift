//
//  SaveNoteInteractorProtocol.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/5/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation

typealias BoolCompletion = ((_ success: Bool, _ error: NSError?)->())

@objc protocol SaveNoteInteractorProtocol{
    func saveNote(note: Note, withCompletion completion: BoolCompletion)
}
