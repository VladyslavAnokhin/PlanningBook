//
//  SaveNoteInteractorProtocol.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/5/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation

protocol SaveNoteInteractorProtocol{
    func saveNote(note: Note, withCompletion completion: BoolCompletion)
}
