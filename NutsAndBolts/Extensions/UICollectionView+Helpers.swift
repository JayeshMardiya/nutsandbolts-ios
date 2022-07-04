//
//  UICollectionView+Helpers.swift
//  NutsAndBolts
//
//  Created by Emel Topaloglu on 4/6/17.
//  Copyright © 2017 Swenson He. All rights reserved.
//

import Foundation

public extension UICollectionView {
    func simpleRegisterClass(cellClass: AnyClass) {
        let className = String.init(describing: cellClass)
        
        if let _ = Bundle.main.path(forResource: className, ofType: "nib") {
            let nib = UINib.init(nibName: className, bundle: nil)
            self.register(nib, forCellWithReuseIdentifier: className)
        }
        else {
            self.register(cellClass, forCellWithReuseIdentifier: className)
        }
    }
    
    func simpleRegisterSupplementaryViewClass(viewClass: AnyClass, isHeader: Bool = true) {
        let className = String.init(describing: viewClass)
        let kind = isHeader ? UICollectionView.elementKindSectionHeader : UICollectionView.elementKindSectionFooter
        
        if let _ = Bundle.main.path(forResource: className, ofType: "nib") {
            let nib = UINib.init(nibName: className, bundle: nil)
            self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
        }
        else {
            self.register(viewClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
        }
    }
}
