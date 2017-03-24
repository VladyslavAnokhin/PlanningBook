//
//  HistoryNotesInteracotProtocol.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/11/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation

 protocol HistoryNotesInteracotProtocol{
    func fetchHistoryFeed(withCompletion completion: NoteArrayCompletion )
    func fetchNextOffset(withCompletion completion: NoteArrayCompletion )
}
