//
//  TableView+VisibleHeaders.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/28/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

public extension UITableView {
    
    var indexesOfVisibleSections: [Int] {
        var visibleSectionIndexes = [Int]()
        
        for i in 0..<numberOfSections {
            var headerRect: CGRect?
            
            if (self.style == .plain) {
                headerRect = rect(forSection: i)
            } else {
                headerRect = rectForHeader(inSection: i)
            }
            if headerRect != nil {
                let visiblePartOfTableView: CGRect = CGRect(x: contentOffset.x, y: contentOffset.y, width: bounds.size.width, height: bounds.size.height)
                if (visiblePartOfTableView.intersects(headerRect!)) {
                    visibleSectionIndexes.append(i)
                }
            }
        }
        return visibleSectionIndexes
    }
    
    var visibleSectionHeaders: [UITableViewHeaderFooterView] {
        var visibleSects = [UITableViewHeaderFooterView]()
        for sectionIndex in indexesOfVisibleSections {
            if let sectionHeader = headerView(forSection: sectionIndex) {
                visibleSects.append(sectionHeader)
            }
        }
        
        return visibleSects
    }
}
