//
//  HistoryNotesViewCotnroller.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

class HistoryNotesViewCotnroller: UIViewController{
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.emptyDataSetSource = emptyDelagateDataSource
            tableView.emptyDataSetDelegate = emptyDelagateDataSource
            tableView.register(cell: HistoryTableViewCell.self)
            tableView.tableFooterView = UIView()
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var emptyDelagateDataSource  : EmptyViewDataSourceDelegate!
    var interactor               : HistoryNotesInteracotProtocol!
    var tableViewAnimator        : TableViewCellAnimator!
    
    var historyTableViewModel = HistoryTableViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor.fetchHistoryFeed { notes, error in
            if let notes = notes {
                self.historyTableViewModel = HistoryTableViewModel(notes: notes)
                self.tableViewAnimator.runAnimation(forTableView: self.tableView)
            }
        }
    }
    
}

extension HistoryNotesViewCotnroller: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return historyTableViewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyTableViewModel.sections[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! HistoryTableViewCell
        let section = historyTableViewModel.sections[indexPath.section]
        let cellModel = section.cells[indexPath.row]
        cell.cellModel = cellModel
        return cell
    }
    
}

extension HistoryNotesViewCotnroller: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return historyTableViewModel.sections[section].header?.title
    }
}
