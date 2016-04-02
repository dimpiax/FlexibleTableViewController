//
//  CellDataProtocol.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 3/25/15.
//  Copyright (c) 2015 Pilipenko Dima. All rights reserved.
//

import Foundation

public protocol CellDataProtocol {
    var title: String { get }
    var category: String? { get }
}
