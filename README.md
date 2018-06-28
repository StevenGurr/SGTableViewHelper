# SGTableViewHelper
A framework to make building UITableViews easier, removing the need for all the boilerplate code. Just define the data in an enum and point the tableview at it, and the rest just works!

# How to use
See the attached example app, but in a nutshell, make an enum like the following.

```swift
enum PersonNameRow: SGTableViewHelperRow {
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
}```

You can also optionally add the callback for when the row is selected, via:
```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
```

Then make instances of these enum types. If you only have one section, then you can skip the need to explicitly declare a section:

```swift
let rows = [PersonNameRow.nameCell(name: "Dave"), PersonNameRow.nameCell(name: "Geoffery")]
tableView.sgTableViewHelper = SGTableViewHelper(rows: rows)
```

Or alternatively if you want to use sections too, they can be declared, and hold their rows, and optional header and footer text:
```swift
let section = SGTableViewHelperSection(rows: rows)
tableView.sgTableViewHelper =  SGTableViewHelper(sections: [section])
```
