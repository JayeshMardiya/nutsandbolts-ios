//
//  UINavigationController+Styling.swift
//  NutsAndBolts
//
//  Created by Emel Topaloglu on 1/30/17.
//  Copyright © 2017 Swenson He. All rights reserved.
//

import Foundation

public extension UINavigationItem {
    
    func setLeftBarButtonItem(image: UIImage?, color: UIColor?, title: String?=nil, target: AnyObject, action: Selector) {
        let item = UIBarButtonItem(image: image, title: title, color: color, target: target, action: action)
        leftBarButtonItem = item
    }
    
    func setRightBarButtonItem(image: UIImage?, color: UIColor?, title: String?=nil, target: AnyObject, action: Selector) {
        let item = UIBarButtonItem(image: image, title: title, color: color, target: target, action: action)
        rightBarButtonItem = item
    }
}

public extension UIBarButtonItem {
    convenience init(image: UIImage?, title: String?, color: UIColor?, target: AnyObject, action: Selector) {
        self.init(title: title, style: UIBarButtonItem.Style.plain, target: target, action: action)
        self.image = image
        self.tintColor = color
    }
}
