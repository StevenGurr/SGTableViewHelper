//
//  ExampleRow.swift
//  SGTableViewTestApp
//
//  Created by Steven Gurr on 28/06/2018.
//  Copyright © 2018 Steven Gurr. All rights reserved.
//

import UIKit
import SGTableViewHelper

enum ExampleRow: SGTableViewHelperRow {
    case nameCell(name: String, age: Int, accessoryType: UITableViewCellAccessoryType)
    case imageCell(imageName: String)
    
    var reuseIdentifier: String {
        switch self {
        case .nameCell:
            return "NameCell"
        case .imageCell:
            return "ImageCell"
        }
    }
    
    var cellConfig: SGCellConfigurerProtocol {
        switch self {
        case let .nameCell(cellData):
            return SGCellConfigurer<NameCell>(cellData: cellData)
        case let .imageCell(image):
            return SGCellConfigurer<LogoCell>(cellData: image)
        }
    }
}
