//
//  UITableView+Helpers.swift
//  NutsAndBolts
//
//  Created by Emel Topaloglu on 1/27/17.
//  Copyright © 2017 Swenson He. All rights reserved.
//

import Foundation

public extension UITableView {
    func simpleRegisterClass(cellClass: AnyClass) {
        let className = String.init(describing: cellClass)
        
        if let _ = Bundle.main.path(forResource: className, ofType: "nib") {
            let nib = UINib.init(nibName: className, bundle: nil)
            self.register(nib, forCellReuseIdentifier: className)
        }
        else {
            self.register(cellClass, forCellReuseIdentifier: className)
        }
    }
    
    func simpleRegisterClassForHeaderFooterView(viewClass: AnyClass) {
        let className = String.init(describing: viewClass)
        
        if let _ = Bundle.main.path(forResource: className, ofType: "nib") {
            let nib = UINib.init(nibName: className, bundle: nil)
            self.register(nib, forHeaderFooterViewReuseIdentifier: className)
        }
        else {
            self.register(viewClass, forHeaderFooterViewReuseIdentifier: className)
        }
    }
}
