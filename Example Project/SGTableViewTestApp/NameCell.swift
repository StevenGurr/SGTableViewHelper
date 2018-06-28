//
//  NameCell.swift
//  SGTableViewTestApp
//
//  Created by Steven Gurr on 26/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
    @IBOutlet private var nameLabel: UILabel!
    
    func configure(name: String) {
        nameLabel.text = name
    }
}
