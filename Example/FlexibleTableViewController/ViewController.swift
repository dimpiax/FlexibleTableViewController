//
//  ViewController.swift
//  FlexibleTableViewController
//
//  Created by Pilipenko Dima on 04/03/2016.
//  Copyright (c) 2016 Pilipenko Dima. All rights reserved.
//

import UIKit
import FlexibleTableViewController

class ViewController: UIViewController {
    private var _vc: FlexibleTableViewController<CustomCellData, OrderedListGenerator<CustomCellData>>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flexibleTableVC = FlexibleTableViewController<CustomCellData, OrderedListGenerator<CustomCellData>>(style: .plain, configuration: TableConfiguation())
        _vc = flexibleTableVC
        
        flexibleTableVC.register(CustomUITableViewCell.self, forCellReuseIdentifier: CustomUITableViewCell.reuseIdentifier)
        
        flexibleTableVC.requestCellIdentifier = { indexPath in
            return CustomUITableViewCell.reuseIdentifier
        }
        
        flexibleTableVC.configureCell = { (cell: UITableViewCell, data: CustomCellData?) in
            guard let data = data else { return false }
            
            if let detailedData = data as? DetailedCustomCellData {
                cell.textLabel?.text = detailedData.title
                cell.detailTextLabel?.text = detailedData.detailed
            }
            
            cell.backgroundColor = data.backgroundColor
            
            return true
        }
        
        flexibleTableVC.cellDidSelect = { indexPath in
            return true
        }
        
        flexibleTableVC.setData(getData())
        
        addChildViewController(flexibleTableVC)
        view.addSubview(flexibleTableVC.view)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        _vc.view.frame = CGRect(x: 0, y: 0, width: 320, height: 200)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func getData() -> TableData<CustomCellData, OrderedListGenerator<CustomCellData>> {
        var data = TableData<CustomCellData, OrderedListGenerator<CustomCellData>>(generator: OrderedListGenerator(titlesOrder: { $0.sorted(by: >) }))
        
        for value in [UIColor(red: 0.01, green: 0.22, blue: 0.25, alpha: 1), UIColor(red: 0.04, green: 0.35, blue: 0.35, alpha: 1), UIColor(red: 0.05, green: 0.45, blue: 0.41, alpha: 1), UIColor(red: 0.07, green: 0.55, blue: 0.45, alpha: 1), UIColor(red: 0.1, green: 0.65, blue: 0.47, alpha: 1)].reversed() {
            let v = CustomCellData(title: "", category: "Ocean")
            v.backgroundColor = value
            data.addItem(v)
        }
        
        data.addItem(DetailedCustomCellData(title: "Atmospheric flow", category: "Troposphere", detailed: "The flow of the atmosphere generally moves in a west to east direction"))
        data.addItem(DetailedCustomCellData(title: "Temperature", category: "Troposphere", detailed: "The temperature of the troposphere generally decreases as altitude increases"))
        data.addItem(DetailedCustomCellData(title: "Pressure of the atmosphere", category: "Troposphere", detailed: "The pressure of the atmosphere is maximum at sea level and decreases with higher altitude"))
        
        for value in [UIColor(red: 0.99, green: 0.52, blue: 0.20, alpha: 1), UIColor(red: 0.95, green: 0.40, blue: 0.20, alpha: 1), UIColor(red: 0.82, green: 0.29, blue: 0.16, alpha: 1)] {
            let v = CustomCellData(title: "", category: "Warm")
            v.backgroundColor = value
            data.addItem(v)
        }
        
        data.generate()
        
        return data
    }
}
