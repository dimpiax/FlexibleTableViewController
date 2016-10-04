//
//  FlexibleTableViewController.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 10/3/15.
//  Copyright © 2015 Pilipenko Dima. All rights reserved.
//

import Foundation
import UIKit

open class FlexibleTableViewController<T: CellDataProtocol, U: ListGeneratorProtocol>: UITableViewController where U.Item == T {
    open var requestCellIdentifier: ((IndexPath) -> String?)?
    open var configureCell: ((UITableViewCell, T?) -> Bool)?
    open var cellDidSelect: ((IndexPath) -> Bool)?
    
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
    
    open func setData(_ value: TableData<T, U>?) {
        _data = value
        tableView.reloadData()
    }
    
    open func getItemData(_ indexPath: IndexPath) -> T? {
        return _data?.getItem(indexPath)
    }
    
    // *** METHODS
    // * FUNCTIONS
    open func register(_ classs: UITableViewCell.Type, forCellReuseIdentifier reuseIdentifier: String) {
        tableView.register(classs, forCellReuseIdentifier: reuseIdentifier)
    }
    
    // * DELEGATES
    // UITableViewDelegate
    override open func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return _data?.getSectionIndexTitlesForTableView()
    }
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if cellDidSelect?(indexPath) == true {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // UITableViewDataSource
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if let identifier = requestCellIdentifier?(indexPath) {
            cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        else {
            cell = UITableViewCell()
        }
        
        return cell
    }
    
    override open func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let itemData = _data?.getItem(indexPath) else {
            return
        }
        
        if configureCell?(cell, itemData) == true {}
        else {
            cell.textLabel!.text = itemData.title
        }
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _data?.getRowsInSection(section) ?? 0
    }
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return _data?.sections ?? 1
    }
    
    override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return _data?.getTitleForHeaderInSection(section)
    }
}
