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
        let rows = [PersonNameRow.nameCell(name: "Dave"), PersonNameRow.nameCell(name: "Geoffery")]
//        let section = SGTableViewHelperSection(rows: rows)
//        return SGTableViewHelper(sections: [section])
        return SGTableViewHelper(rows: rows)
    }()
    
    override func viewDidLoad() {
        tableView.sgTableViewHelper = helper
        tableView.sgTableViewHelperDelegate = self
    }
}

extension ViewController: SGTableViewHelperDelegate {
    
    func tableView(_ tableView: UITableView, didSelect row: SGTableViewHelperRow, at indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selected \(row)")
    }
}
