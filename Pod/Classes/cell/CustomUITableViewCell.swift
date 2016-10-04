//
//  CustomUITableViewCell.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 3/26/15.
//  Copyright (c) 2015 Pilipenko Dima. All rights reserved.
//

import Foundation
import UIKit

open class CustomUITableViewCell: UITableViewCell {
    class open  var reuseIdentifier: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
