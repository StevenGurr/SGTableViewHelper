//
//  LogoCell.swift
//  SGTableViewTestApp
//
//  Created by Steven Gurr on 16/07/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import UIKit
import SGTableViewHelper

class LogoCell: UITableViewCell, SGConfigurableCell {
    typealias CellData = String
    
    @IBOutlet private var logoImageView: UIImageView!
    
    func configure(cellData: CellData) {
        logoImageView.image = UIImage(named: cellData)
    }
}
