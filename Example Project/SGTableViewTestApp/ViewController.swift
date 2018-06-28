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
    @IBOutlet private var tableView: UITableView!
    
    lazy var data: SGTableViewDataSource = {
        let row = PersonNameRow.nameCell
        let section = SGTableViewDataSourceSection(rows: [PersonNameRow.nameCell(name: "Dave"), PersonNameRow.nameCell(name: "Geoffery")])
        return SGTableViewDataSource(sections: [section])
    }()
    
    override func viewDidLoad() {
       tableView.sgTableDataSource = data
    }
}
