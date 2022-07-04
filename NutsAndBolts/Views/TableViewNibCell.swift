//
//  TableViewNibCell.swift
//  NutsAndBolts
//
//  Created by Bugra Sirin on 10/19/17.
//  Copyright © 2017 Swenson He. All rights reserved.
//

import Foundation
import UIKit

open class TableViewNibCell: UITableViewCell {
    open class func instance() -> Self {
        return self.instanceFromNib()
    }
}
