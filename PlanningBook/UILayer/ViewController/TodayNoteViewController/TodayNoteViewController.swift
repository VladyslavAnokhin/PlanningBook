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
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    func createNewNoteAction(){
        
    }
    
}
