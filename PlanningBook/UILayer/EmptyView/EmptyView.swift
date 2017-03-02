//
//  EmptyView.swift
//  Planning Book
//
//  Created by Vladyslav Anokhin on 3/1/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

class EmptyView: XibLoadeblView{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    var title: String!{
        didSet{
            titleLabel.text = title
        }
    }
    
    var actionButtonTitle: String!{
        didSet{
            actionButton.setTitle(actionButtonTitle, for: .normal)
        }
    }
    
   override var intrinsicContentSize: CGSize {
        return CGSize(width: 320, height: 270)
    }
    
    @IBAction func actionButtonDidPress(_ sender: UIButton) {
        
    }
}
