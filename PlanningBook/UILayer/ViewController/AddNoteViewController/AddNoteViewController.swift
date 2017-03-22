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
                        category: Category(name: "Work"),
                        dateRange: dateRange)
        
        return note
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        performSegue(withIdentifier: "SelectCategorySegue", sender: nil)
    }
}


class BaseTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    let presenter: UIViewControllerAnimatedTransitioning
    let dismisser: UIViewControllerAnimatedTransitioning
    
    init(presenter: UIViewControllerAnimatedTransitioning, dismisser: UIViewControllerAnimatedTransitioning){
        self.presenter = presenter
        self.dismisser = dismisser
        super.init()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismisser
    }
    
    func animationControllerForPresentedController(presented: UIViewController,
                                                   presentingController presenting: UIViewController,
                                                   sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presenter
    }
}

class PresentationTransition: NSObject, UIViewControllerAnimatedTransitioning {

    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.72
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        
        let options = UIViewAnimationOptions.curveEaseIn
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                                   delay: 0.0,
                                   usingSpringWithDamping: 0.64,
                                   initialSpringVelocity: 0.22,
                                   options: options,
                                   animations: {
//                                        fromVC.view.transform = CGAffineTransform(translationX: -20, y: 0)
                                        toVC.view.transform = CGAffineTransform(translationX: -20, y: 0)
                                    },
                                   completion: { finished in
                                    
                                    transitionContext.completeTransition(true)
                                    }
        )
    }
}

class DismissTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.72
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        
        let options = UIViewAnimationOptions.curveEaseIn
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       delay: 0.0,
                       usingSpringWithDamping: 0.64,
                       initialSpringVelocity: 0.22,
                       options: options,
                       animations: {
                        
        },
                       completion: { finished in
                        
                        transitionContext.completeTransition(true)
        }
        )
    }
}

