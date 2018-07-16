# SGTableViewHelper
In iOS development a huge amount of time is spent with UITableViews, and each time there's a lot of the same stuff to do and worry about. You have to define some kind of model to hold the data for each cell as it's dequeued, several places where a small error results in an out of bounds problems causing a horrible crash, and in `cellForRowAt` there's all that casting of the UITableViewCell instance to the type you really know it is.

SGTableViewHelper is a framework to make all that easier, removing the need for all the boilerplate code. Just define the smallest required amount of information in an `enum` and point the tableview at it, and the rest just works! Add associated values and have them automatically passed in to a `configure()` method on the cells. No more worrying about getting the number of rows wrong, no more array out of bounds issues, etc; and best of all no more manually casting a `UITableViewCell` to your real cell types!

With thanks to the blog post at http://holko.pl/2016/01/05/typed-table-view-controller/ for helping me realise how effective PATs can be for this job.

Please check out the example project for a working demonstration of the whole thing.

# How to use
## SGTableViewHelperRow
The framework defines a protocol called `SGTableViewHelperRow` which simply has two things you have to return.

```swift
protocol SGTableViewHelperRow {
    var reuseIdentifier: String { get }
    var cellConfig: SGCellConfigurerProtocol { get }
}
```

Declare an enum which implements this protocol, with a `case` statement for each row type (and custom cell definition) you have. Then simply implement the `reuseIdentifier` property for each of the `case`s with the string that's in your prototype cell definition. For the `cellConfig` property you will need to return an instance of the generic `SGCellConfigurer` with type information telling it which `UITableViewCell` subclass you will be using for that `case`. From the example project:

```swift
enum ExampleRow: SGTableViewHelperRow {
    case nameCell(name: String, age: Int, accessoryType: UITableViewCellAccessoryType)
    
    var reuseIdentifier: String {
        switch self {
        case .nameCell:
            return "NameCell"
        }
    }
    
    var cellConfig: SGCellConfigurerProtocol {
        switch self {
        case let .nameCell(cellData):
            return SGCellConfigurer<NameCell>(cellData: cellData)
        }
    }
}
```

## SGConfigurableCell
In each of the `UITableViewCell` subclasses, implement `SGConfigurableCell`. `SGConfigurableCell` defines just one function:
```swift
func configure(cellData: CellData)
```

Implement the protocol and define that function to do whatever setting of UI elements you need to do. All the data the cell needs will come in via the `cellData` parameter.

The final step to make it all work is in each of the `SGConfigurableCell` implementing classes add a typealias for `CellData`. It describes what data will need to pass in to the cell to configure it before it's drawn. In the example project I've used a tuple type `typealias CellData = (name: String, age: Int, accessoryType: UITableViewCellAccessoryType)`, but it can just as easily be `typealias CellData = String` if you only need to pass one `String` in.

## SGTableViewHelperDelegate
On the ViewController hosting the `UITableView`, implement the protocol `SGTableViewHelperDelegate` to know when a row was selected. This is similar to the standard `func tableView(_ tableView: UITableView, 
         didSelectRowAt indexPath: IndexPath)` except that it passes in the instance of `SGTableViewHelperRow` which was selected alongside the `UITableView` and `IndexPath` instances.
```swift
func tableView(_ tableView: UITableView, didSelect row: SGTableViewHelperRow, at indexPath: IndexPath)
```
If you don't want to know about row selection, this is optional.

## SGTableViewHelper
Finally, to get the data in to the `UITableView` build an array of the above `enum` `case` instances implementing `SGTableViewHelperRow`. If your `UITableView` has multiple sections then also instantiate instances of `SGTableViewHelperSection` to hold the rows for each section. Finally put the rows or sections in to an instance of `SGTableViewHelper`, and assign that to the `sgTableViewHelper` property of the `UITableView` 

```swift
let rows = [PersonNameRow.nameCell(name: "Dave"), PersonNameRow.nameCell(name: "Geoffery")]
let helper = SGTableViewHelper(rows: rows)
tableView.sgTableViewHelper = helper
```

## Section Header And Footer
The `init` of `SGTableViewHelperSection` takes a `titleForHeader` optional String, and a `titleForFooter` optional String. If you want these, you may want to use a `SGTableViewHelperSection` instance to wrap the rows, even if you only want to display a single section.
