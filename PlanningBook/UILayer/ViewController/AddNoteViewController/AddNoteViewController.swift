//
//  AddNoteViewController.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/4/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    enum PickedDate{
        case startDate, endDate
    }
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteBodyTextView: UITextView!
    
    @IBOutlet weak var startDateButton: UIButton!
    @IBOutlet weak var endDateButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    private var startDate: Date?
    private var endDate: Date?
    
    var saveInteractor: SaveNoteInteractorProtocol!
    var datePicker: DatePickerViewProtocol!{
        didSet{
            datePicker.recivePickedDate = { pickedDate in
                if self.pickedDateType! == .startDate{
                    self.updateStartDate(withDate: pickedDate)
                } else if self.pickedDateType! == .endDate {
                    self.updateEndDate(withDate: pickedDate)
                }
            }
        }
    }
    
    private var pickedDateType: PickedDate?
    
    @IBAction func startDateAction(_ sender: Any) {
        pickedDateType = .startDate
        datePicker.present(onViewController: self, withDate: nil)
    }
    @IBAction func endDayAction(_ sender: Any) {
        pickedDateType = .endDate
        datePicker.present(onViewController: self, withDate:  nil)
    }
    @IBAction func saveAction(_ sender: Any) {
        if let note = noteFromCurrentState(){
            saveInteractor.saveNote(note: note, withCompletion: {success, error in
                if success {
                    
                }
            })
        }
    }
    
   private func updateStartDate(withDate date: Date){
        startDate = date
    }
    
    private func updateEndDate(withDate date: Date){
        endDate = date
    }
    
    private func noteFromCurrentState() -> Note? {
        guard let startDate = startDate,
              let endDate = endDate else {
            return nil
        }
        
        let dateRange = DateRange(start: startDate, end: endDate)
        let note = Note(title: noteTitleTextField.text!,
                        body: noteBodyTextView.text!,
                        dateRange: dateRange)
        
        return note
    }
}

