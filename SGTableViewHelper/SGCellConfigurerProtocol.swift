//
//  SGCellConfigurerProtocol.swift
//  SGTableViewHelper
//
//  Created by Steven Gurr on 13/07/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import UIKit

public protocol SGCellConfigurerProtocol {
    func configure(cell: UITableViewCell)
}

public struct SGCellConfigurer<CellType> where CellType: SGConfigurableCell, CellType: UITableViewCell {
    public let cellData: CellType.CellData
    
    public init(cellData: CellType.CellData) {
        self.cellData = cellData
    }
}

extension SGCellConfigurer: SGCellConfigurerProtocol {
    public func configure(cell: UITableViewCell) {
        if let cell = cell as? CellType {
            cell.configure(cellData: cellData)
        }
    }
}
