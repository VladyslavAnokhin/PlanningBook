//
//  NoteViewController.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/30/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController{
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weekDatLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    var note: Note!{
        didSet{
            let _ = view
            noteTitleLabel.text = note.title
            descriptionLabel.text = note.body
        }
    }
}

extension NoteViewController{
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
