//
//  UITableView+SGTableViewData.swift
//  SGTableViewData
//
//  Created by Steven Gurr on 26/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import Foundation

fileprivate let dataSourceKey = "SGDataSource"

public extension UITableView {
    public var sgTableDataSource: SGTableViewDataSource {
        get {
            return objc_getAssociatedObject(self, dataSourceKey) as! SGTableViewDataSource
        }
        set {
            objc_setAssociatedObject(self, dataSourceKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
