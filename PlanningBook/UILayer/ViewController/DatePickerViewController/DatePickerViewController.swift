//
//  DatePickerViewController.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/4/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit


class DatePickerViewController: UIViewController {
    
    var recivePickedDate: DateBlock?
    private var selectedDate: Date?
    internal weak var datePickerView: DateTimePicker?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let datePickerView = DateTimePicker.show(selected: selectedDate, minimumDate: Date(), maximumDate: nil)
        datePickerView.completionHandler = { date in
            self.dismiss()
            self.recivePickedDate?(date)
        }
        view.addSubview(datePickerView)
    }
}

extension DatePickerViewController: DatePickerViewProtocol{
    
    func present(onViewController viewController: UIViewController, withDate date: Date? = nil ){
        viewController.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
        self.view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        viewController.present(self, animated: true, completion: nil)
    }
    
    func dismiss(){
        self.dismiss(animated: true, completion: { [weak self] in
            if let strongSelf = self{
                strongSelf.datePickerView?.removeFromSuperview()
            }
            
        })
    }
}
