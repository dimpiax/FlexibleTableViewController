# FlexibleTableViewController

[![CI Status](http://img.shields.io/travis/dimpiax/FlexibleTableViewController.svg?style=flat)](https://travis-ci.org/dimpiax/FlexibleTableViewController)
[![Version](https://img.shields.io/cocoapods/v/FlexibleTableViewController.svg?style=flat)](http://cocoapods.org/pods/FlexibleTableViewController)
[![License](https://img.shields.io/cocoapods/l/FlexibleTableViewController.svg?style=flat)](http://cocoapods.org/pods/FlexibleTableViewController)
[![Platform](https://img.shields.io/cocoapods/p/FlexibleTableViewController.svg?style=flat)](http://cocoapods.org/pods/FlexibleTableViewController)

Swift library of generic table view controller with external data processing of functionality,
like determine cell's `reuseIdentifier` related to `indexPath`, 
configuration of requested cell for display and cell selection handler

<img src=thumbnail.png width=25% height=25% />

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Wrapper initialization and cell registering. 
```
let flexibleTableVC = FlexibleTableViewController<CustomCellData, OrderedListGenerator<CustomCellData>>(style: .plain, configuration: TableConfiguation())
flexibleTableVC.register(CustomUITableViewCell.self, forCellReuseIdentifier: CustomUITableViewCell.reuseIdentifier)
```

Define "reuse identifier" relatively to indexPath:
```
flexibleTableVC.requestCellIdentifier = { indexPath in
  return CustomUITableViewCell.reuseIdentifier
}
```

Configure cell relatively to data:
```
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
```
flexibleTableVC.cellDidSelect = { indexPath in
  // return true for immediately deselection
  return true
}
```

## Requirements

Swift 3 or above

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
