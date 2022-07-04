//
//  RadioButtonGroup.swift
//  NutsAndBolts
//
//  Created by Sinem Alak on 2/7/19.
//  Copyright © 2019 Swenson He. All rights reserved.
//

import Foundation
import UIKit

protocol RadioButtonGroupDelegate: class {
    func radioButtonGroupValueChanged(group: RadioButtonGroup, radioButton: RadioButton)
}

class RadioButtonGroup: UIView {
    fileprivate let stackView = UIStackView()
    public weak var delegate: RadioButtonGroupDelegate?
    public var group: [RadioButton] = [] {
        didSet {
            self.setUpStackView()
        }
    }
    public var axis: NSLayoutConstraint.Axis = .horizontal {
        didSet {
            self.stackView.axis = axis
        }
    }
    public var alignment: UIStackView.Alignment = .fill {
        didSet {
            self.stackView.alignment = alignment
        }
    }
    public var distribution: UIStackView.Distribution = .fillEqually {
        didSet {
            self.stackView.distribution = distribution
        }
    }
    
    public convenience init(axis: NSLayoutConstraint.Axis, buttons: [RadioButton]) {
        self.init(frame: CGRect.zero)
        self.axis = axis
        self.group = buttons
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInit()
    }
    
    func customInit() {
        self.stackView.axis = axis
        self.stackView.alignment = .fill
        self.stackView.distribution = .fillEqually
        self.stackView.backgroundColor = .clear
        self.setUpStackView()
    }
    
    public func selectRadio(button: RadioButton) {
        radioButtonTapped(button: button)
    }
    
    fileprivate func setUpStackView() {
        for view in stackView.arrangedSubviews {
            stackView.removeArrangedSubview(view)
        }
        
        for button in group {
            button.delegate = self
            stackView.addArrangedSubview(button)
        }
    }
}

extension RadioButtonGroup: RadioButtonDelegate {
    func radioButtonTapped(button: RadioButton) {
        guard !button.isSelected else {
            return
        }
        
        button.isSelected = true
        for (index, _button) in group.enumerated() {
            if button != _button {
                group[index].isSelected = false
            }
        }
        
        delegate?.radioButtonGroupValueChanged(group: self, radioButton: button)
    }
}
