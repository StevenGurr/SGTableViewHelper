//
//  SGTableViewDataSource.swift
//  SGTableViewData
//
//  Created by Steven Gurr on 26/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import Foundation

struct SGTableViewHelper {
    let sections: [SGTableViewHelperSection]
    
    var numberOfSections: Int {
        return sections.count
    }
    
    public init(sections: [SGTableViewHelperSection]) {
        self.sections = sections
    }
    
    public init(rows: [SGTableViewHelperRow]) {
        self.sections = [SGTableViewHelperSection(rows: rows)]
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: sections[indexPath.section].rows[indexPath.row].reuseIdentifier, for: indexPath)
    }
    
    func row(at indexPath: IndexPath) -> SGTableViewHelperRow {
        return sections[indexPath.section].rows[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].titleForHeader
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].titleForFooter
    }
}
