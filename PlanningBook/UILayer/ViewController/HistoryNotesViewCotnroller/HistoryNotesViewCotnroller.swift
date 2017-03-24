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
        }
    }
    
    var emptyDelagateDataSource: EmptyViewDataSourceDelegate!
    var interactor: HistoryNotesInteracotProtocol! = RealmHistoryNotesInteracot()
    
    var dataSource = [HistoryTableViewCellModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor.fetchHistoryFeed { notes, error in
            if let notes = notes {
                let dataForamtter = DateFormatter()
                dataForamtter.dateFormat = "dd-MM-yyyy HH:mm"
                
                self.dataSource = notes.map{HistoryTableViewCellModel(note: $0, dataFormatter: dataForamtter)}
                self.tableView.reloadData()
            }
        }
    }
    
}

extension HistoryNotesViewCotnroller: UITableViewDataSource {
    
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
