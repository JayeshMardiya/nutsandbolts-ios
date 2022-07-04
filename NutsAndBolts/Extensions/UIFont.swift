//
//  UIFont.swift
//  NutsAndBolts
//
//  Created by Emel Topaloglu on 2/20/17.
//  Copyright © 2017 Swenson He. All rights reserved.
//

import Foundation

public extension UIFont {
    
    func withTraits(traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        if let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits)) {
            return UIFont(descriptor: descriptor, size: 0)
        }
        return self
    }
    
    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
    
    func expanded() -> UIFont {
        return withTraits(traits: .traitExpanded)
    }
}
