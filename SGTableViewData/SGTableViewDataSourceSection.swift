//
//  SGTableViewDataSourceSection.swift
//  SGTableViewData
//
//  Created by Steven Gurr on 28/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import Foundation

public struct SGTableViewDataSourceSection {
    let rows: [SGTableViewDataSourceRow]
    let titleForHeader: String?
    let titleForFooter: String?
    
    public init(rows: [SGTableViewDataSourceRow], titleForHeader: String? = nil, titleForFooter: String? = nil) {
        self.rows = rows
        self.titleForHeader = titleForHeader
        self.titleForFooter = titleForFooter
    }
}

