//
//  FlexibleTableViewController.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 10/3/15.
//  Copyright © 2015 Pilipenko Dima. All rights reserved.
//

import Foundation
import UIKit

final public class FlexibleTableViewController<T: CellDataProtocol, U: ListGeneratorProtocol>: UITableViewController where U.Item == T {
    public var requestCellIdentifier: ((IndexPath) -> String?)?
    public var configureCell: ((UITableViewCell, T?) -> Bool)?
    public var cellDidSelect: ((IndexPath) -> Bool)?
    
    fileprivate var _data: TableData<T, U>?
    
    public init(style: UITableViewStyle, configuration: TableConfiguation) {
        super.init(style: style)
        
        tableView.backgroundColor = configuration.backgroundColor
        tableView.sectionHeaderHeight = configuration.sectionHeaderHeight
        tableView.rowHeight = configuration.rowHeight
        
        tableView.sectionIndexTrackingBackgroundColor = configuration.sectionIndexTrackingBackgroundColor
        tableView.sectionIndexColor = configuration.sectionIndexColor
        tableView.sectionIndexBackgroundColor = configuration.sectionIndexBackgroundColor
        
        tableView.separatorStyle = .singleLineEtched
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setData(_ value: TableData<T, U>?) {
        _data = value
        tableView.reloadData()
    }
    
    public func getItemData(_ indexPath: IndexPath) -> T? {
        return _data?.getItem(indexPath)
    }
    
    // *** METHODS
    // * FUNCTIONS
    public func register(_ classs: UITableViewCell.Type, forCellReuseIdentifier reuseIdentifier: String) {
        tableView.register(classs, forCellReuseIdentifier: reuseIdentifier)
    }
    
    // * DELEGATES
    // UITableViewDelegate
    override public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return _data?.getSectionIndexTitlesForTableView()
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if cellDidSelect?(indexPath) == true {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // UITableViewDataSource
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if let identifier = requestCellIdentifier?(indexPath) {
            cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        else {
            cell = UITableViewCell()
        }
        
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let itemData = _data?.getItem(indexPath) else {
            return
        }
        
        if configureCell?(cell, itemData) == true {}
        else {
            cell.textLabel!.text = itemData.title
        }
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _data?.getRowsInSection(section) ?? 0
    }
    
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return _data?.sections ?? 1
    }
    
    override public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return _data?.getTitleForHeaderInSection(section)
    }
}
