//
//  TableView+Register.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

extension UITableView{
    
    func register<T: UITableViewCell>(cell cellType: T.Type)
        where T: ReusableView, T: NibOwner {
            let nib = UINib(nibName: T.nibName, bundle: nil)
            register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(headerFooter headerFooterTypr: T.Type)
        where T: ReusableView, T: NibOwner {
            let nib = UINib(nibName: T.nibName, bundle: nil)
            register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
}

extension UICollectionView{
    
    func register<T: UICollectionViewCell>(cell cellType: T.Type)
        where T: ReusableView, T: NibOwner {
            let nib = UINib(nibName: T.nibName, bundle: nil)
            register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
}


