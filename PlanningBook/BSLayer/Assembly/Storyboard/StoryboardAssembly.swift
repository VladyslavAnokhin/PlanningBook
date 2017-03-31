//
//  StoryboardAssembly.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/2/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct StoryboardAssebmly {
    
    func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}

extension UIStoryboard {
    func controller<T: UIViewController>() -> T where T: NibOwner   {
        return self.instantiateViewController(withIdentifier: T.nibName) as! T
    }
}
