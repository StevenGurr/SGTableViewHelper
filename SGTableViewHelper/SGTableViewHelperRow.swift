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
    var cellConfig: SGCellConfigurerProtocol { get }
}
