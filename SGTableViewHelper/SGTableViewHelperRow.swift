//
//  SGTableViewDataSourceRow.swift
//  SGTableViewData
//
//  Created by Steven Gurr on 28/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import Foundation

public protocol SGTableViewHelperRow {
    var reuseIdentifier: String { get }
    
    // UITableViewDelegate callbacks
    func willDisplay(cell: UITableViewCell)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

public extension SGTableViewHelperRow {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
