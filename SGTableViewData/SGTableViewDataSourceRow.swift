//
//  SGTableViewDataSourceRow.swift
//  SGTableViewData
//
//  Created by Steven Gurr on 28/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import Foundation

public protocol SGTableViewDataSourceRow {
    var reuseIdentifier: String { get }
    var configureBlock: (UITableViewCell) -> Void { get }
    func willDisplay(cell: UITableViewCell)
}
