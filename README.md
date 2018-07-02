## SGTableViewHelper
A framework to make building `UITableView`s easier, removing the need for all the boilerplate code. Just define the smallest required amount of information in `enum` `case`s and point the tableview at it, and the rest just works! No more worrying about getting the number of rows wrong, no more array out of bounds issues, etc!

## How to use
# UITableView Cell Definitions
The Framework defines a protocol called `SGTableViewHelperRow` which looks like this:

```swift
public protocol SGTableViewHelperRow {
    // Required
    var reuseIdentifier: String { get }
    
    // Optional
    func willDisplay(cell: UITableViewCell)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}
```

Declared an enum which implements this protocol, with a `case` statement for each row type you have. Then implement the `reuseIdentifier` property for each of the `case`s with the string that's in your prototype cell definition. For example:

```swift
enum PersonNameRow: SGTableViewHelperRow {
    case nameCell(name: String)
    
    var reuseIdentifier: String {
        switch self {
        case .nameCell:
            return "NameCell"
        }
    }
}
```

In this enum you can optionally add two functions. Firsly:
```swift
func willDisplay(cell: UITableViewCell)
```
The default implementation does absolutely nothing, but if you need to configure the cells contents before they're displayed, this is where you do it. The `UITableViewCell` instance is passed in via the parameter.

Secondly, the callback for when the row is selected, via:
```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
```
The default implementation of this just calls `deselectRow(at indexPath: IndexPath, animated: Bool))`.

# Single Section Example
If your `UITableView` only has one section, then you just need to make an array of instances of the aforementioned `enum`, where each one represents a row in your table, in order. Then put that array in to an instance of `SGTableViewHelper`. For example:
```swift
let rows = [PersonNameRow.nameCell(name: "Dave"), PersonNameRow.nameCell(name: "Geoffery")]
let helper = SGTableViewHelper(rows: rows)
```

Finally assign the `SGTableViewHelper` instance to the `sgTableViewHelper` property of the `UITableView` 

```swift
let rows = [PersonNameRow.nameCell(name: "Dave"), PersonNameRow.nameCell(name: "Geoffery")]
let helper = SGTableViewHelper(rows: rows)
tableView.sgTableViewHelper = helper
```

# Multiple Section Example
If you need more than one section to use sections too, prepare your rows in to arrays as above, then instantiate some `SGTableViewHelperSection`s. Each one represents a section in the `UITableView`, and holds the array of rows (`SGTableViewHelperRow` instances) that belong within that section. For example:

```swift
let section1 = SGTableViewHelperSection(rows: section1Rows)
let section2 = SGTableViewHelperSection(rows: section2Rows)
let helper = SGTableViewHelper(sections: [section])
```

Finally, as in the single section example, assign the helper to the `sgTableViewHelper` property on your `UITableView`.
```swift
let section1 = SGTableViewHelperSection(rows: section1Rows)
let section2 = SGTableViewHelperSection(rows: section2Rows)
let helper = SGTableViewHelper(sections: [section])
tableView.sgTableViewHelper = helper
```

# Section Header And Footer
The `init` of `SGTableViewHelperSection` takes a `titleForHeader` optional String, and a `titleForFooter` optional String. If you want these, you may want to use a `SGTableViewHelperSection` instance to wrap the rows, even if you only want to display a single section.
