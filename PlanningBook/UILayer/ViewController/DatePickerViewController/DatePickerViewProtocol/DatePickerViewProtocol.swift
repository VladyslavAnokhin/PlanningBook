//
//  DatePickerViewProtocol.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/5/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit



 protocol DatePickerViewProtocol {
    var recivePickedDate: DateBlock? {get set}
    
    func present(onViewController viewController: UIViewController, withDate date: Date? )
    func dismiss()
}
