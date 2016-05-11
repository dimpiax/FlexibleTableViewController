//
//  FlexibleTableViewController.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 10/3/15.
//  Copyright © 2015 Pilipenko Dima. All rights reserved.
//

import Foundation
import UIKit

public class FlexibleTableViewController<T: CellDataProtocol, U: ListGeneratorProtocol where U.Item == T>: UITableViewController {
    public var requestCellIdentifier: (NSIndexPath -> String?)?
    public var configureCell: ((UITableViewCell, T?) -> Bool)?
    public var cellDidSelect: (NSIndexPath -> Bool)?
    
    private var _data: TableData<T, U>?
    
    public init(style: UITableViewStyle, configuration: TableConfiguation) {
        super.init(style: style)
        
        tableView.backgroundColor = configuration.backgroundColor
        tableView.sectionHeaderHeight = configuration.sectionHeaderHeight
        tableView.rowHeight = configuration.rowHeight
        
        tableView.sectionIndexTrackingBackgroundColor = configuration.sectionIndexTrackingBackgroundColor
        tableView.sectionIndexColor = configuration.sectionIndexColor
        tableView.sectionIndexBackgroundColor = configuration.sectionIndexBackgroundColor
        
        tableView.separatorStyle = .SingleLineEtched
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    public func setData(value: TableData<T, U>?) {
        _data = value
        tableView.reloadData()
    }
    
    public func getItemData(indexPath: NSIndexPath) -> T? {
        return _data?.getItem(indexPath)
    }
    
    // *** METHODS
    // * FUNCTIONS
    public func registerCell(classs: UITableViewCell.Type, reuseIdentifier: String) {
        tableView.registerClass(classs, forCellReuseIdentifier: reuseIdentifier)
    }
    
    // * DELEGATES
    // UITableViewDelegate
    override public func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return _data?.getSectionIndexTitlesForTableView()
    }
    
    override public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if cellDidSelect?(indexPath) == true {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    // UITableViewDataSource
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if let identifier = requestCellIdentifier?(indexPath) {
            cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        }
        else {
            cell = UITableViewCell()
        }
        
        return cell
    }
    
    override public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        guard let itemData = _data?.getItem(indexPath) else {
            return
        }
        
        if configureCell?(cell, itemData) == true {}
        else {
            cell.textLabel!.text = itemData.title
        }
    }
    
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _data?.getRowsInSection(section) ?? 0
    }
    
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return _data?.sections ?? 1
    }
    
    override public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return _data?.getTitleForHeaderInSection(section)
    }
}