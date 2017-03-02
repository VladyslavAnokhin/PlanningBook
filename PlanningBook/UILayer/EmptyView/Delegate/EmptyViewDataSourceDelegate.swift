//
//  EmptyViewDataSourceDelegate.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import DZNEmptyDataSet

class EmptyViewDataSourceDelegate: NSObject, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    let title: String
    let buttonTitle: String
    
    init(title: String, buttonTitle: String){
        self.title = title
        self.buttonTitle = buttonTitle
    }
    
    // MARK: DZNEmptyDataSetSource
    func customView(forEmptyDataSet scrollView: UIScrollView!) -> UIView! {
        let viewFrame = CGRect(x: 0,
                               y: 0,
                               width: scrollView.frame.width,
                               height: scrollView.frame.height / 2)
        let emptyView = EmptyView(frame: viewFrame)
        emptyView.title = title
        emptyView.actionButtonTitle = buttonTitle
        return emptyView
    }
    
    // MARK: DZNEmptyDataSetDelegate
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        return -round( scrollView.frame.height / 4 )
    }
}
