//
//  OrderedListGenerator.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 3/25/15.
//  Copyright (c) 2015 Pilipenko Dima. All rights reserved.
//

import Foundation

public struct OrderedListGenerator<Item: CellDataProtocol>: ListGeneratorProtocol {
    fileprivate var _titlesOrder: ((Set<String>) -> [String])?
    fileprivate var _data: [[Item]]?
    fileprivate var _titles: [String]?
    
    public var titles: [String]? {
        return _titles
    }
    
    init() {
        // empty
    }
    
    public init(titlesOrder: @escaping ((Set<String>) -> [String])) {
        _titlesOrder = titlesOrder
    }
    
    // *** METHODS
    // * FUNCTIONS
    mutating public func generate(_ data: [Item]) {
        var titles = Set<String>()
        for value in data where value.category != nil {
            titles.insert(value.category!)
        }
        
        guard titles.count > 0 else { return }
        
        _titles = (_titlesOrder?(titles) ?? titles.sorted(by: <)).map { $0 }
        _ = appendFindedValue(&_titles!, value: "#")
        _data = generateListRelatedToKeys(_titles!, data: data)
    }
    
    public func getSectionData(_ value: Int) -> [Item]? {
        return _data?[value]
    }
    
    public func getData(_ section: Int, row: Int) -> Item? {
        guard let arr = getSectionData(section) else { return nil }
        
        return arr.count > row ? arr[row] : nil
    }
    
    // PRIVATE
    fileprivate func generateListRelatedToKeys(_ value: [String], data: [Item]) -> [[Item]] {
        var list = [[Item]]()
        var tempData = data
        var tempTitles = Array(value.reversed())
        var length = tempTitles.count
        while length > 0 {
            length -= 1
            
            let value = tempTitles[length]
            tempTitles.remove(at: length)
            
            var arr: [Item] = []
            var length = tempData.count
            while length > 0 {
                length -= 1
                let element = tempData[length]
                
                if element.category == value {
                    arr.append(element)
                    tempData.remove(at: length)
                }
            }
            list.append(arr)
        }
        return list
    }
    
    fileprivate func appendFindedValue<Item: Equatable>(_ arr: inout [Item], value: Item) -> Bool {
        if let index = arr.index(of: value) {
            arr.append(arr.remove(at: index))
            return true
        }
        return false
    }
}
