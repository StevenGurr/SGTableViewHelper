//
//  SGTableViewDataSource.swift
//  SGTableViewData
//
//  Created by Steven Gurr on 26/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import Foundation

public struct SGTableViewDataSource {
    let sections: [SGTableViewDataSourceSection]
    
    public var numberOfSections: Int {
        return sections.count
    }
    
    public init(sections: [SGTableViewDataSourceSection]) {
        self.sections = sections
    }
    
    public func numberOfRowsIn(section: Int) -> Int {
        return sections[section].rows.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: sections[indexPath.section].rows[indexPath.row].reuseIdentifier, for: indexPath)
    }
    
    public func row(at indexPath: IndexPath) -> SGTableViewDataSourceRow {
        return sections[indexPath.section].rows[indexPath.row]
    }
    
    public func willDisplay(cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        sections[indexPath.section].rows[indexPath.row].willDisplay(cell: cell)
    }
}

public struct SGTableViewDataSourceSection {
    let rows: [SGTableViewDataSourceRow]
    
    public init(rows: [SGTableViewDataSourceRow]) {
        self.rows = rows
    }
}

public protocol SGTableViewDataSourceRow {
    var reuseIdentifier: String { get }
    var configureBlock: (UITableViewCell) -> Void { get }
    func willDisplay(cell: UITableViewCell)
}
