//
//  ViewController.swift
//  SGTableViewTestApp
//
//  Created by Steven Gurr on 26/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import UIKit
import SGTableViewHelper

class ViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    lazy var helper: SGTableViewHelper = {
        let row = PersonNameRow.nameCell
        let section = SGTableViewHelperSection(rows: [PersonNameRow.nameCell(name: "Dave"), PersonNameRow.nameCell(name: "Geoffery")])
        return SGTableViewHelper(sections: [section])
    }()
    
    override func viewDidLoad() {
       tableView.sgTableViewHelper = helper
    }
}
