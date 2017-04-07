//
//  TodayNoteViewController.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

class TodayNoteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(cell: HistoryTableViewCell.self)
            tableView.dataSource = self
        }
    }
    
    
    var interactor: DayNotesInteractorProtocol! = RealmTodayNotesInteractor()
    var tableViewModel: HistoryTableViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor.fetchNotes(forDay: Date()) { (notes, error) in
            
        }
        
    }
}

