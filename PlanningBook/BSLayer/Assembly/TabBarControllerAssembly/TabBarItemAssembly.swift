//
//  TabBarItemAssembly.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

struct TabBarItemAssembly{
    func todayNoteTabBarItem() -> UITabBarItem {
        return UITabBarItem(title: "Today", image: nil, selectedImage: nil)
    }
    
    
    func historyTabBarItem() -> UITabBarItem {
         return UITabBarItem(title: "History", image: nil, selectedImage: nil)
    }
    
    func addNoteTabBarItem() -> UITabBarItem {
        return UITabBarItem(title: "Add Note", image: nil, selectedImage: nil)
    }
}
