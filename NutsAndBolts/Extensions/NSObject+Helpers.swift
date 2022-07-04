//
//  NSObject+Helpers.swift
//  NutsAndBolts
//
//  Created by Emel Topaloglu on 1/27/17.
//  Copyright © 2017 Swenson He. All rights reserved.
//

import Foundation

public extension NSObject {
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
