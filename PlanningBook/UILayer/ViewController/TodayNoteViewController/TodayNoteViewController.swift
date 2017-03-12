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
            tableView.emptyDataSetSource = emptyDelagateDataSource
            tableView.emptyDataSetDelegate = emptyDelagateDataSource
            tableView.register(cell: HistoryTableViewCell.self)
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
        }
    }
    
    var emptyDelagateDataSource: EmptyViewDataSourceDelegate!{
        didSet{
            emptyDelagateDataSource.buttonActionHandler = {
                self.createNewNoteAction()
            }
        }
    }
    
    var dataSource = [HistoryTableViewCellModel]()
    var interactor: TodayNotesInteractorProtocol! = RealmTodayNotesInteractor()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor.fetchTodayFeed { (notes, error) in
            if let notes = notes {
                let dataForamtter = DateFormatter()
                dataForamtter.dateFormat = "dd-MM-yyyy"
                self.dataSource = notes.map{HistoryTableViewCellModel(note: $0, dataFormatter: dataForamtter)}
                self.tableView.reloadData()
            }
        }
    }
    
    func createNewNoteAction(){
        
    }
    
}

extension TodayNoteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! HistoryTableViewCell
        cell.cellModel = dataSource[indexPath.row]
        return cell
    }
    
}
