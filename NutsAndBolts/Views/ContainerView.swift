//
//  ContainerView.swift
//  NutsAndBolts
//
//  Created by Sinem Alak on 10/10/16.
//  Copyright © 2016 Swenson He. All rights reserved.
//

import UIKit

open class ContainerView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        setContentHuggingPriority((UILayoutPriority.defaultHigh + 1.0), for: .vertical)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
        setContentHuggingPriority((UILayoutPriority.defaultHigh + 1.0), for: .vertical)
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        setContentHuggingPriority((UILayoutPriority.defaultHigh + 1.0), for: .vertical)
    }
    
    @discardableResult
    func embedView(view: UIView) -> [NSLayoutConstraint] {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        constraints.append(view.constraintDistanceToSuperview(value: 0.0, at: .top))
        constraints.append(view.constraintDistanceToSuperview(value: 0.0, at: .leading))
        constraints.append(view.constraintDistanceToSuperview(value: 0.0, at: .trailing))
        var properties = LayoutConstraintProperties()
        properties.layoutConstraintPropertiesWithPriority(priority: layoutPriorityAlmostRequired)
        constraints.append(view.constraintDistanceToSuperview(value: 0.0, at: .bottom, properties: properties))
        clipsToBounds = true
    
        return constraints
    }
    
}
