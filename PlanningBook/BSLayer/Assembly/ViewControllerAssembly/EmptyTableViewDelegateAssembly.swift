//
//  ViewControllerAssembly.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/2/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct EmptyTableViewDelegateAssembly {
    
    func todayPlansEmptyViewDelegate() -> EmptyViewDataSourceDelegate {
        return EmptyViewDataSourceDelegate(title: "Today you haven't any plans", buttonTitle: "Add plans!")
    }
    
    func historyEmptyViewDelegate() -> EmptyViewDataSourceDelegate {
        return EmptyViewDataSourceDelegate(title: "You don't add any plans", buttonTitle: "Create new one")
    }
    
}
