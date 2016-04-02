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
    let backgroundColor: UIColor = UIColor.whiteColor()
    let sectionHeaderHeight: CGFloat = 35
    let rowHeight: CGFloat = 50
    
    let separatorStyle: UITableViewCellSeparatorStyle = .SingleLineEtched
    
    let sectionIndexTrackingBackgroundColor = UIColor(white: 1, alpha: 0.5)
    let sectionIndexColor = UIColor(red: 0.55, green: 0.61, blue: 0.87, alpha: 1)
    let sectionIndexBackgroundColor = UIColor(white: 1, alpha: 0.8)
    
    public init() {
        
    }
}