//
//  TableData.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 3/25/15.
//  Copyright (c) 2015 Pilipenko Dima. All rights reserved.
//

import Foundation

public struct TableData<T: CellDataProtocol, U: ListGeneratorProtocol where U.Item == T> {
    private var _arr: [T]?
    private var _generator: U?
    
    init() {
        // empty
    }
    
    public init(generator: U) {
        _generator = generator
    }
    
    var sections: Int {
        return _generator?.titles?.count ?? 1
    }
    
    var isEmpty: Bool {
        if let arr = _arr {
            return arr.isEmpty
        }
        return true
    }
    
    mutating public func addItem(value: T) {
        if _arr == nil { _arr = [] }
        _arr!.append(value)
    }
    
    mutating public func filter(includeElement: T -> Bool) {
        _arr = _arr?.filter(includeElement)
    }
    
    mutating public func generate() {
        guard let arr = _arr else { return }
        
        _generator?.generate(arr)
    }
    
    func getItem(indexPath: NSIndexPath) -> T? {
        return _generator?.getData(indexPath.section, row: indexPath.row) ?? _arr?[indexPath.row]
    }
    
    func getRowsInSection(value: Int) -> Int {
        return  _generator?.getSectionData(value)?.count ?? _arr?.count ?? 0
    }
    
    func getTitleForHeaderInSection(value: Int) -> String? {
        return _generator?.titles?[value]
    }
    
    func getSectionIndexTitlesForTableView() -> [String]? {
        return _generator?.titles?.map { value in
            String(value.substringToIndex(value.startIndex.successor()))
        }
    }
    
    func each(@noescape element: T -> Bool) {
        guard let arr = _arr else { return }
        
        for value in arr {
            if element(value) { break }
        }
    }
}