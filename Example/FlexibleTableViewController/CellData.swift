//
//  CellData.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 3/25/15.
//  Copyright (c) 2015 Pilipenko Dima. All rights reserved.
//

import Foundation
import UIKit
import FlexibleTableViewController

class CustomCellData: CellDataProtocol {
    private let _title: String
    private var _category: String?
    
    var title: String { return _title }
    var category: String? { return _category }
    
    var backgroundColor = UIColor.clearColor()
    
    init(title: String, category: String? = nil) {
        _title = title
        _category = category
    }
}

class DetailedCustomCellData: CustomCellData {
    let detailed: String
    
    init(title: String, category: String, detailed: String) {
        self.detailed = detailed
        
        super.init(title: title, category: category)
    }
}