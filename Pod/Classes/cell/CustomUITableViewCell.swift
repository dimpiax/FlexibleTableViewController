//
//  CustomUITableViewCell.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 3/26/15.
//  Copyright (c) 2015 Pilipenko Dima. All rights reserved.
//

import Foundation
import UIKit

public class CustomUITableViewCell: UITableViewCell {
    class public  var reuseIdentifier: String {
        return String(self)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
