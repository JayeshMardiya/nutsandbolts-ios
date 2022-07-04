//
//  UITableViewCell+Helpers.swift
//  NutsAndBolts
//
//  Created by Bugra Sirin on 10/19/17.
//  Copyright © 2017 Swenson He. All rights reserved.
//

import Foundation
import UIKit

public extension UITableViewCell {
    class func defaultReuseIdentifier() -> String {
        let className = String.init(describing: self)
        return className
    }
}
