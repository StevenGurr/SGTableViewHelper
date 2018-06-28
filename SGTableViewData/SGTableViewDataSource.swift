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
    
    var numberOfSections: Int {
        return sections.count
    }
    
    public init(sections: [SGTableViewDataSourceSection]) {
        self.sections = sections
    }
    
    public init(rows: [SGTableViewDataSourceRow]) {
        self.sections = [SGTableViewDataSourceSection(rows: rows)]
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: sections[indexPath.section].rows[indexPath.row].reuseIdentifier, for: indexPath)
    }
    
    func row(at indexPath: IndexPath) -> SGTableViewDataSourceRow {
        return sections[indexPath.section].rows[indexPath.row]
    }
    
//    func willDisplay(cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        sections[indexPath.section].rows[indexPath.row].willDisplay(cell: cell)
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].titleForHeader
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].titleForFooter
    }
}
