//
//  TableConfiguration.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 3/26/15.
//  Copyright (c) 2015 Pilipenko Dima. All rights reserved.
//

import Foundation
import UIKit

public struct TableConfiguation {
    let backgroundColor: UIColor
    let sectionHeaderHeight: CGFloat
    let rowHeight: CGFloat
    let estimatedRowHeight: CGFloat
    
    let contentInset: UIEdgeInsets
    
    let separatorStyle: UITableViewCellSeparatorStyle
    
    let sectionIndexTrackingBackgroundColor: UIColor
    let sectionIndexColor: UIColor
    let sectionIndexBackgroundColor: UIColor
    
    public init() {
        backgroundColor = .white
        sectionHeaderHeight = 35
        rowHeight = 50
        estimatedRowHeight = 50
        
        contentInset = .zero
        
        separatorStyle = .singleLineEtched
        
        sectionIndexTrackingBackgroundColor = UIColor(white: 1, alpha: 0.5)
        sectionIndexColor = UIColor(red: 0.55, green: 0.61, blue: 0.87, alpha: 1)
        sectionIndexBackgroundColor = UIColor(white: 1, alpha: 0.8)
    }
    
    public init(backgroundColor: UIColor, sectionHeaderHeight: CGFloat, rowHeight: CGFloat, estimatedRowHeight: CGFloat, contentInset: UIEdgeInsets, separatorStyle: UITableViewCellSeparatorStyle, sectionIndexTrackingBackgroundColor: UIColor, sectionIndexColor: UIColor, sectionIndexBackgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.sectionHeaderHeight = sectionHeaderHeight
        self.rowHeight = rowHeight
        self.estimatedRowHeight = estimatedRowHeight
        
        self.contentInset = contentInset
        
        self.separatorStyle = separatorStyle
        
        self.sectionIndexTrackingBackgroundColor = sectionIndexTrackingBackgroundColor
        self.sectionIndexColor = sectionIndexColor
        self.sectionIndexBackgroundColor = sectionIndexBackgroundColor
    }
}
