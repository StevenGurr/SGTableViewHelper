//
//  NameCell.swift
//  SGTableViewTestApp
//
//  Created by Steven Gurr on 26/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import UIKit
import SGTableViewHelper

class NameCell: UITableViewCell, SGConfigurableCell {
    typealias CellData = (name: String, age: Int, accessoryType: UITableViewCellAccessoryType)
    
    @IBOutlet private var nameLabel: UILabel!
    
    func configure(cellData: CellData) {
        nameLabel.text = "\(cellData.name) is \(cellData.age) years old."
        self.accessoryType = cellData.accessoryType
    }
}
