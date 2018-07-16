//
//  SGConfigurableCell.swift
//  SGTableViewHelper
//
//  Created by Steven Gurr on 13/07/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import Foundation

public protocol SGConfigurableCell: class {
    associatedtype CellData
    func configure(cellData: CellData)
}
