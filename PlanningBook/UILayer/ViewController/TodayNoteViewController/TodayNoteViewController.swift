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

class TodayNoteViewController: DayViewController {

    var interactor: DayNotesInteractorProtocol! = RealmTodayNotesInteractor()
    var dataSource = [Note]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func eventViewsForDate(_ date: Date) -> [EventView] {
        var views = [EventView]()
        
        for event in dataSource {
            let view = EventView()
            view.datePeriod = TimePeriod(beginning: event.dateRange.start,
                                         end: event.dateRange.end)
            // Add info: event title, subtitle, location to the array of Strings
//            var info = [event.title, event.location]
//            info.append("\(datePeriod.beginning!.format(with: "HH:mm")!) - \(datePeriod.end!.format(with: "HH:mm")!)")
//            view.data = info
            
            views.append(view)
        }
        
        return views
    }

    
}
