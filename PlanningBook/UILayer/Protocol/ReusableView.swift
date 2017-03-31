//
//  ReusableView.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

protocol ReusableView {}
extension ReusableView  {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView{}
extension UICollectionViewCell: ReusableView{}
