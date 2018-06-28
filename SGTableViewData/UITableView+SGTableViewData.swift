//
//  UITableView+SGTableViewData.swift
//  SGTableViewData
//
//  Created by Steven Gurr on 26/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import Foundation

fileprivate let dataSourceKey = "SGDataSource"
fileprivate let handlerKey = "SGTableViewHandler"

public extension UITableView {
    public var sgTableDataSource: SGTableViewDataSource? {
        get {
            return objc_getAssociatedObject(self, dataSourceKey) as? SGTableViewDataSource
        }
        set {
            objc_setAssociatedObject(self, dataSourceKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            
            if let newValue = newValue {
                let handler = TableViewHandler(dataSource: newValue)
                dataSource = handler
                delegate = handler
                objc_setAssociatedObject(self, handlerKey, handler, .OBJC_ASSOCIATION_RETAIN)
            } else {
                objc_setAssociatedObject(self, handlerKey, nil, .OBJC_ASSOCIATION_RETAIN)
            }
        }
    }
}

private class TableViewHandler: NSObject {
    private let dataSource: SGTableViewDataSource

    init(dataSource: SGTableViewDataSource) {
        self.dataSource = dataSource
        super.init()
    }
}

extension TableViewHandler: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfRowsIn(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource.tableView(tableView, titleForHeaderInSection: section)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return dataSource.tableView(tableView, titleForFooterInSection: section)
    }
}

extension TableViewHandler: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        dataSource.row(at: indexPath).willDisplay(cell: cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource.row(at: indexPath).tableView(tableView, didSelectRowAt: indexPath)
    }
}
