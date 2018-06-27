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
        
        var configureBlock: (UITableViewCell) -> Void {
            switch self {
            case .nameCell:
                return { _ in }
            }
        }
        
        func willDisplay(cell: UITableViewCell) {
            switch self {
            case let .nameCell(name):
                (cell as? NameCell)?.configureNameCell(name: name)
            }
        }
    }
    
    @IBOutlet private var tableView: UITableView!
    
    lazy var data: SGTableViewDataSource = {
        let row = Row.nameCell
        let section = SGTableViewDataSourceSection(rows: [Row.nameCell(name: "Dave"), Row.nameCell(name: "Bob")])
        return SGTableViewDataSource(sections: [section])
    }()
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.sgTableDataSource = data
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return data.tableView(tableView, cellForRowAt: indexPath)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        data.willDisplay(cell: cell, forRowAt: indexPath)
    }
}
