//
//  PersonNameRow.swift
//  SGTableViewTestApp
//
//  Created by Steven Gurr on 28/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import UIKit
import SGTableViewHelper

enum PersonNameRow: SGTableViewHelperRow {
    case nameCell(name: String)
    
    var reuseIdentifier: String {
        switch self {
        case .nameCell:
            return "NameCell"
        }
    }
    
    func cellForRow(cell: UITableViewCell) {
        switch self {
        case let .nameCell(name):
            (cell as? NameCell)?.configure(name: name)
        }
    }
}
