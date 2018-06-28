//
//  UITableView+SGTableViewData.swift
//  SGTableViewData
//
//  Created by Steven Gurr on 26/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import UIKit

private let helperKey = "SGHelper"
private let handlerKey = "SGTableViewHandler"

public extension UITableView {
    public var sgTableViewHelper: SGTableViewHelper? {
        get {
            return objc_getAssociatedObject(self, helperKey) as? SGTableViewHelper
        }
        set(helper) {
            objc_setAssociatedObject(self, helperKey, helper, .OBJC_ASSOCIATION_RETAIN)
            
            if let helper = helper {
                let handler = TableViewHandler(helper: helper)
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
    private let helper: SGTableViewHelper

    init(helper: SGTableViewHelper) {
        self.helper = helper
        super.init()
    }
}

extension TableViewHandler: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return helper.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helper.numberOfRowsIn(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return helper.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return helper.tableView(tableView, titleForHeaderInSection: section)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return helper.tableView(tableView, titleForFooterInSection: section)
    }
}

extension TableViewHandler: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        helper.row(at: indexPath).willDisplay(cell: cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        helper.row(at: indexPath).tableView(tableView, didSelectRowAt: indexPath)
    }
}
