//
//  ViewController.swift
//  SGTableViewTestApp
//
//  Created by Steven Gurr on 26/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import UIKit
import SGTableViewData

class ViewController: UIViewController {
    enum Row: SGTableViewDataSourceRow {
        case nameCell(name: String)
        
        var reuseIdentifier: String {
            switch self {
            case .nameCell:
                return "NameCell"
            }
        }
        
        func willDisplay(cell: UITableViewCell) {
            switch self {
            case let .nameCell(name):
                (cell as? NameCell)?.configure(name: name)
            }
        }
    }
    
    @IBOutlet private var tableView: UITableView!
    
    lazy var data: SGTableViewDataSource = {
        let row = Row.nameCell
        let section = SGTableViewDataSourceSection(rows: [Row.nameCell(name: "Dave"), Row.nameCell(name: "Geoffery")])
        return SGTableViewDataSource(sections: [section])
    }()
    
    override func viewDidLoad() {
       tableView.sgTableDataSource = data
    }
}
