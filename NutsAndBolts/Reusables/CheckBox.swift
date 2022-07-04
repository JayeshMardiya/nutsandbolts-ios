//
//  CheckBox.swift
//  NutsAndBolts
//
//  Created by Sinem Alak on 2/7/19.
//  Copyright © 2019 Swenson He. All rights reserved.
//

import Foundation
import UIKit

protocol CheckBoxDelegate: class {
    func checkBoxSelected(button: CheckBox)
}

class CheckBox: UIButton {
    public weak var delegate: CheckBoxDelegate?
    public var title: String = "" {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }
    
    public convenience init(title: String = "", normal image: UIImage, selected selectedImage: UIImage) {
        self.init(frame: CGRect.zero)
        self.setImage(image, for: .normal)
        self.setImage(selectedImage, for: .selected)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    func customInit() {
        self.contentHorizontalAlignment = .left
        self.imageRect(forContentRect: CGRect(x: 0, y: 0, width: 20, height: 20))
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0);
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0);
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.setTitle(title, for: .normal)
    }
    
    @objc func buttonTapped() {
        self.isSelected = !self.isSelected
        delegate?.checkBoxSelected(button: self)
    }
}

