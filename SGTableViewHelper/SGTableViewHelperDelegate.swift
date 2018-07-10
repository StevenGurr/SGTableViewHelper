//
//  SGTableViewHelperDelegate.swift
//  SGTableViewHelper
//
//  Created by Steven Gurr on 02/07/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import UIKit

public protocol SGTableViewHelperDelegate: class {
    func tableView(_ tableView: UITableView, didSelect row: SGTableViewHelperRow, at indexPath: IndexPath)
}
