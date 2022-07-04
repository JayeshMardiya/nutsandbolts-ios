//
//  Label.swift
//  NutsAndBolts
//
//  Created by Bugra Sirin on 10/19/17.
//  Copyright © 2017 Swenson He. All rights reserved.
//

import Foundation
import UIKit

open class Label: UILabel {
    public init() {
        super.init(frame: .zero)
        customInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    open override var numberOfLines: Int {
        didSet {
            self.adjustsFontSizeToFitWidth = numberOfLines != 0
        }
    }
    
    func customInit() {
        self.numberOfLines = 0
        self.textAlignment = .center
    }
    
    public var textInsets: UIEdgeInsets = .zero {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override open func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    
    override open func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        if (self.text == nil || self.text == "") {
            return super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        }
        else {
            let insetRect = bounds.inset(by: textInsets)
            let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
            let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                              left: -textInsets.left,
                                              bottom: -textInsets.bottom,
                                              right: -textInsets.right)
            return textRect.inset(by: invertedInsets)
        }
    }
}
