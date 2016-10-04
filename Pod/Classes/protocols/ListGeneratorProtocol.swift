//
//  ListGeneratorProtocol.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 3/25/15.
//  Copyright (c) 2015 Pilipenko Dima. All rights reserved.
//

import Foundation

public protocol ListGeneratorProtocol {
    associatedtype Item
    
    var titles: [String]? { get }
    
    func getSectionData(_ value: Int) -> [Item]?
    func getData(_ section: Int, row: Int) -> Item?
    
    mutating func generate(_ data: [Item])
}
