//
//  TodayNoteViewController.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit
import CalendarKit
import DateToolsSwift

class TodayNoteViewController: DayViewController, Refreshable {
    
    var interactor: DayNotesInteractorProtocol! = RealmTodayNotesInteractor()
    var cachedEvents = [Date: [Note]]()
    
    override func eventViewsForDate(_ date: Date) -> [EventView] {
        
        var views = [EventView]()
        
        interactor.fetchNotes(forDay: date, withCompletion: { (notes, error) in
            if let notes = notes {
                views = self.eventsView(forDate: date, withNotes:  notes)
            }
        })
        
        return views
    }
    
    private func eventsView(forDate date: Date, withNotes notes: [Note]) -> [EventView] {
        var views = [EventView]()
        
        for event in  notes {
            let view = EventView()
            let datePeriod = TimePeriod(beginning: event.dateRange.start, end: event.dateRange.end)
            let dateString = "\(datePeriod.beginning!.format(with: "HH:mm")) - \(datePeriod.end!.format(with: "HH:mm"))"
            view.datePeriod = datePeriod
            view.data = [event.title, dateString]
            
            views.append(view)
        }
        
        return views
    }
    
    func refreshUI() {
        reloadData()
    }
}

