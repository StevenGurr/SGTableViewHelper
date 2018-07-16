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
    
    private lazy var rows: [ExampleRow] = [.nameCell(name: "Dave", age: 34, accessoryType: .disclosureIndicator),
                                       .nameCell(name: "Geoffery", age: 42, accessoryType: .detailButton),
                                       .imageCell(imageName: "lawyers"),
                                       .imageCell(imageName: "soilcorp")]
    
    private lazy var helper: SGTableViewHelper = {
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
        print("Selected \(row) at indexPath \(indexPath)")
    }
}
