//
//  TodayNotesInteractorProtocol.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/12/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation

 protocol DayNotesInteractorProtocol{
    func fetchNotes(forDay date: Date, withCompletion completion: NoteArrayCompletion )
}
