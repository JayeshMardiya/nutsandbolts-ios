//
//  Array+Helpers.swift
//  NutsAndBolts
//
//  Created by Emel Topaloglu on 5/1/17.
//  Copyright © 2017 Swenson He. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(_ object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}
