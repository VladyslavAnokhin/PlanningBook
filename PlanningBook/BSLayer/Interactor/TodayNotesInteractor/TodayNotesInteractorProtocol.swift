//
//  TodayNotesInteractorProtocol.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/12/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation

@objc protocol TodayNotesInteractorProtocol{
    func fetchTodayFeed(withCompletion completion: NoteArrayCompletion )
    func fetchNextOffset(withCompletion completion: NoteArrayCompletion )
}
