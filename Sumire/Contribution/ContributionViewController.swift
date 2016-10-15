//
//  ContributionViewController.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit
import SwiftDate

class ContributionViewController: UITableViewController {
    
    private var models: [ContributionCellViewModel] = []
    
    override func viewDidLoad() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        generateDebugData()
        tableView.reloadData()
    }
    
    private func generateDebugData() {
        let h1 = ContributionCellViewModel(name: "母方祖父", amount: 58310400, colorInt: 0)
        let h2 = ContributionCellViewModel(name: "父方祖父", amount: 26014040, colorInt: 1)
        let h3 = ContributionCellViewModel(name: "父", amount: 53000, colorInt: 2)
        let h4 = ContributionCellViewModel(name: "イオン", amount: 47600, colorInt: 3)
        let h5 = ContributionCellViewModel(name: "母方祖母", amount: 32200, colorInt: 4)
        
        models = [h1, h2, h3, h4, h5]
    }
}

// MARK: UITableViewDataSource

extension ContributionViewController {
    internal override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    internal override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    internal override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    internal override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let model = models[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ContributionCell", forIndexPath: indexPath) as! ContributionCell
        cell.setup(model)
        return cell
    }
}
