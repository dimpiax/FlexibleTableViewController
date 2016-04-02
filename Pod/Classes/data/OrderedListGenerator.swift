//
//  OrderedListGenerator.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 3/25/15.
//  Copyright (c) 2015 Pilipenko Dima. All rights reserved.
//

import Foundation

public struct OrderedListGenerator<Item: CellDataProtocol>: ListGeneratorProtocol {
    private var _titlesOrder: (Set<String> -> [String])?
    private var _data: [[Item]]?
    private var _titles: [String]?
    
    public var titles: [String]? {
        return _titles
    }
    
    init() {
        // empty
    }
    
    public init(titlesOrder: (Set<String> -> [String])) {
        _titlesOrder = titlesOrder
    }
    
    // *** METHODS
    // * FUNCTIONS
    mutating public func generate(data: [Item]) {
        var titles = Set<String>()
        for value in data where value.category != nil {
            titles.insert(value.category!)
        }
        
        guard titles.count > 0 else { return }
        
        _titles = (_titlesOrder?(titles) ?? titles.sort(<)).map { $0 }
        appendFindedValue(&_titles!, value: "#")
        _data = generateListRelatedToKeys(_titles!, data: data)
    }
    
    public func getSectionData(value: Int) -> [Item]? {
        return _data?[value]
    }
    
    public func getData(section: Int, row: Int) -> Item? {
        guard let arr = getSectionData(section) else { return nil }
        
        return arr.count > row ? arr[row] : nil
    }
    
    // PRIVATE
    private func generateListRelatedToKeys(value: [String], data: [Item]) -> [[Item]] {
        var list = [[Item]]()
        var tempData = data
        var tempTitles = Array(value.reverse())
        var length = tempTitles.count
        while length > 0 {
            length -= 1
            
            let value = tempTitles[length]
            tempTitles.removeAtIndex(length)
            
            var arr: [Item] = []
            var length = tempData.count
            while length > 0 {
                length -= 1
                let element = tempData[length]
                
                if element.category == value {
                    arr.append(element)
                    tempData.removeAtIndex(length)
                }
            }
            list.append(arr)
        }
        return list
    }
    
    private func appendFindedValue<Item: Equatable>(inout arr: [Item], value: Item) -> Bool {
        if let index = arr.indexOf(value) {
            arr.append(arr.removeAtIndex(index))
            return true
        }
        return false
    }
}