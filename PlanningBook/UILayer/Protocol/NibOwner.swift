//
//  NibOwner.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

protocol NibOwner {}
extension NibOwner {
    
    static var nibName: String {
        return String(describing: self)
    }
}

