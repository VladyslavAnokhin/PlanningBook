//
//  TabBarController.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit
import ColorMatchTabs

class TabBarController: ColorMatchTabsViewController {
    
    var tabBarDataSource: ColorTabsDataSource!{
        didSet{
            dataSource = tabBarDataSource
            reloadData()
        }
    }
}

class ColorTabsDataSource: NSObject, ColorMatchTabsViewControllerDataSource {
    
    var viewControllers: [UIViewController]!
    
    func numberOfItems(inController controller: ColorMatchTabsViewController) -> Int {
        return viewControllers!.count
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllers![index]
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, titleAt index: Int) -> String {
        return TabItemsProvider.items[index].title
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, iconAt index: Int) -> UIImage {
        return TabItemsProvider.items[index].normalImage
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, hightlightedIconAt index: Int) -> UIImage {
        return TabItemsProvider.items[index].highlightedImage
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, tintColorAt index: Int) -> UIColor {
        return TabItemsProvider.items[index].tintColor
    }
    
}

class TabItemsProvider {
    
    static let items = {
        return [
            TabItem(
                title: "Products",
                tintColor: UIColor(red: 0.51, green: 0.72, blue: 0.25, alpha: 1.00),
                normalImage: UIImage(named: "products_normal")!,
                highlightedImage: UIImage(named: "products_highlighted")!
            ),
            TabItem(
                title: "Places",
                tintColor: UIColor(red: 0.15, green: 0.67, blue: 0.99, alpha: 1.00),
                normalImage: UIImage(named: "venues_normal")!,
                highlightedImage: UIImage(named: "venues_highlighted")!
            ),
            TabItem(
                title: "Reviews",
                tintColor: UIColor(red: 1.00, green: 0.61, blue: 0.16, alpha: 1.00),
                normalImage: UIImage(named: "reviews_normal")!,
                highlightedImage: UIImage(named: "reviews_highlighted")!
            )
        ]
    }()
    
}

struct TabItem {
    
    let title: String
    let tintColor: UIColor
    let normalImage: UIImage
    let highlightedImage: UIImage
}
