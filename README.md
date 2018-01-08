# FlexibleTableViewController

[![Language](https://img.shields.io/badge/swift-4.0-fec42e.svg)](https://swift.org/blog/swift-4-0-released/)
[![Version](https://img.shields.io/cocoapods/v/FlexibleTableViewController.svg?style=flat)](http://cocoapods.org/pods/FlexibleTableViewController)
[![License](https://img.shields.io/cocoapods/l/FlexibleTableViewController.svg?style=flat)](http://cocoapods.org/pods/FlexibleTableViewController)
[![Platform](https://img.shields.io/cocoapods/p/FlexibleTableViewController.svg?style=flat)](http://cocoapods.org/pods/FlexibleTableViewController)

Swift library of generic table view controller with external data processing of functionality,
like determine cell's `reuseIdentifier` related to `indexPath`, 
configuration of requested cell for display and cell selection handler etc

<img src=thumbnail.png width=25% height=25% />

## Example

Initialization and cell registering. 
```swift
let flexibleTableVC = FlexibleTableViewController<CustomCellData, OrderedListGenerator<CustomCellData>>(style: .plain, configuration: TableConfiguation())
flexibleTableVC.register(CustomUITableViewCell.self, forCellReuseIdentifier: CustomUITableViewCell.reuseIdentifier)
```

Define "reuse identifier" relatively to indexPath:
```swift
flexibleTableVC.requestCellIdentifier = { indexPath in
  return CustomUITableViewCell.reuseIdentifier
}
```

Configure cell relatively to data:
```swift
flexibleTableVC.configureCell = { (cell: UITableViewCell, data: CustomCellData?) in
  guard let data = data else { return false }

  if let detailedData = data as? DetailedCustomCellData {
    cell.textLabel?.text = detailedData.title
    cell.detailTextLabel?.text = detailedData.detailed
  }

  cell.backgroundColor = data.backgroundColor

  return true
}
```

Process cell select here:
```swift
flexibleTableVC.cellDidSelect = { indexPath in
  // return true for immediately deselection
  return true
}
```

## Requirements

Updated to Swift 4

###### For Swift 3.1 version use [v.2.0.6](../../releases/tag/2.0.6)
###### For Swift 2.2 version use [v.1.1.0](../../releases/tag/1.1.0)

## Installation

FlexibleTableViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FlexibleTableViewController"
```

## Author

Pilipenko Dima, dimpiax@gmail.com

##### Also article on Medium: https://medium.com/@dimpiax/swift-flexibletableviewcontroller-dbd17087e0b9

## License

FlexibleTableViewController is available under the MIT license. See the LICENSE file for more info.
