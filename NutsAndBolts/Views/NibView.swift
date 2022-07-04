//
//  NibView.swift
//  NutsAndBolts
//
//  Created by Emel Topaloglu on 2/2/17.
//  Copyright © 2017 Swenson He. All rights reserved.
//

import Foundation

open class NibView: UIView {
    open class func instance() -> Self {
        return self.instanceFromNib()
    }
    
    override open func awakeAfter(using aDecoder: NSCoder) -> Any? {
        if subviews.count == 0 {
            guard let view = type(of: self).instanceFromNib() else {
                return nil
            }
            view.frame = frame
            view.autoresizingMask = autoresizingMask
            view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
            
            for constraint in constraints {
                var firstItem = constraint.firstItem
                var secondItem = constraint.secondItem
                
                if firstItem as? NSObject == self {
                    firstItem = view
                }
                
                if secondItem != nil && secondItem as? NSObject == self {
                    secondItem = view
                }
                
                let newConstraint = NSLayoutConstraint(item: firstItem,
                                                       attribute: constraint.firstAttribute,
                                                       relatedBy: constraint.relation,
                                                       toItem: secondItem,
                                                       attribute: constraint.secondAttribute,
                                                       multiplier: constraint.multiplier,
                                                       constant: constraint.constant)
                
                view.addConstraint(newConstraint)
            }
            return view
        } else {
            return self
        }
    }
}
