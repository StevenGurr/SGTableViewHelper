//
//  SGTableViewDataSourceRow.swift
//  SGTableViewData
//
//  Created by Steven Gurr on 28/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import UIKit

public protocol SGTableViewHelperRow {
    var reuseIdentifier: String { get }
    
    func cellForRow(cell: UITableViewCell)
    func willDisplay(cell: UITableViewCell)
}

public extension SGTableViewHelperRow {
    public func cellForRow(cell: UITableViewCell) {
        // Do nothing
    }
    
    public func willDisplay(cell: UITableViewCell) {
        // Do nothing
    }
}
