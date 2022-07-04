//
//  UICollectionViewCell+Helpers.swift
//  NutsAndBolts
//
//  Created by Bugra Sirin on 2/16/18.
//  Copyright © 2018 Swenson He. All rights reserved.
//

import Foundation

public extension UICollectionReusableView {
    class func defaultReuseIdentifier() -> String {
        let className = String.init(describing: self)
        return className
    }
}
