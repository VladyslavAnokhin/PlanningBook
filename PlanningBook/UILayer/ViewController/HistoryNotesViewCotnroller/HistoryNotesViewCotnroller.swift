//
//  HistoryNotesViewCotnroller.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

@objc protocol FetchNotesInteracotProtocol{
    
}

class HistoryNotesViewCotnroller: UIViewController{
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.emptyDataSetSource = emptyDelagateDataSource
            tableView.emptyDataSetDelegate = emptyDelagateDataSource
            tableView.register(cell: HistoryTableViewCell.self)
            tableView.tableFooterView = UIView()
        }
    }
    
    var emptyDelagateDataSource: EmptyViewDataSourceDelegate!
    var interactor: FetchNotesInteracotProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension HistoryNotesViewCotnroller: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.reuseIdentifier,
                                                 for: indexPath)
        
        return cell
    }
    
}
