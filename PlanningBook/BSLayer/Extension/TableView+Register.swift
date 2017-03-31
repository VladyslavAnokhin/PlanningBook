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
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: NSIndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
}

extension UICollectionView{
    
    func register<T: UICollectionViewCell>(cell cellType: T.Type)
        where T: ReusableView, T: NibOwner {
            let nib = UINib(nibName: T.nibName, bundle: nil)
            register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
}


