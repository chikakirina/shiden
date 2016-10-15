//
//  PaybackViewController.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit
import SwiftDate

class PaybackViewController: UITableViewController {
    
    private var models: [InfoCellViewModel] = []
    
    override func viewDidLoad() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        generateDebugData()
        tableView.reloadData()
    }
    
    private func generateDebugData() {
        let i1 = InfoCellViewModel(type: .description, name: "種類", description: "第二種奨学金", year: nil, month: nil, totalAmount: nil, averageAmount: nil, loanTotalAmount: nil, interestAmount: nil, interestRate: nil)

        let i2 = InfoCellViewModel(type: .normalAmount, name: "返済期間", description: nil, year: nil, month: nil, totalAmount: 20, averageAmount: nil, loanTotalAmount: nil, interestAmount: nil, interestRate: nil)
        
        let i3 = InfoCellViewModel(type: .normalAmount, name: "借入総額", description: nil, year: nil, month: nil, totalAmount: 4000000, averageAmount: nil, loanTotalAmount: nil, interestAmount: nil, interestRate: nil)
        
        let i4 = InfoCellViewModel(type: .normalAmount, name: "月々の返済額", description: nil, year: nil, month: nil, totalAmount: 50000, averageAmount: nil, loanTotalAmount: nil, interestAmount: nil, interestRate: nil)
        
        let i5 = InfoCellViewModel(type: .payback, name: nil, description: nil, year: nil, month: nil, totalAmount: 5441745, averageAmount: 56129, loanTotalAmount: 4000000, interestAmount: 1441745, interestRate: 0.03)
        
        models = [i1, i2, i3, i4, i5]
    }
}

// MARK: UITableViewDataSource

extension PaybackViewController {
    internal override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    internal override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let infoModel = models[indexPath.row]
        
        switch infoModel.type {
        case .normalAmount, .description:
            return 50
        case .save, .short:
            return 190
        case .payback:
            return 225
        }
    }
    
    internal override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    internal override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let infoModel = models[indexPath.row]
        
        switch infoModel.type {
        case .normalAmount:
            let cell = tableView.dequeueReusableCellWithIdentifier("normalAmount", forIndexPath: indexPath) as! InfoAmountCell
            indexPath.row == 1 ? cell.setup(infoModel, amountSafix: "年") : cell.setup(infoModel)
            return cell
        case .description:
            let cell = tableView.dequeueReusableCellWithIdentifier("description", forIndexPath: indexPath) as! InfoDescriptionCell
            cell.setup(infoModel)
            return cell
        case .save:
            let cell = tableView.dequeueReusableCellWithIdentifier("save", forIndexPath: indexPath) as! InfoSaveCell
            cell.setup(infoModel)
            return cell
        case .short:
            let cell = tableView.dequeueReusableCellWithIdentifier("short", forIndexPath: indexPath) as! InfoShortCell
            cell.setup(infoModel)
            return cell
        case .payback:
            let cell = tableView.dequeueReusableCellWithIdentifier("payback", forIndexPath: indexPath) as! InfoPaybackCell
            cell.setup(infoModel)
            return cell
        }
    }
}
