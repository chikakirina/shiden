//
//  SavingPlanViewController.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit
import SwiftDate

class SavingPlanViewController: UITableViewController {
    
    private var models: [InfoCellViewModel] = []
    
    override func viewDidLoad() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        generateDebugData()
        tableView.reloadData()
    }
    
    private func generateDebugData() {
        let i1 = InfoCellViewModel(type: .normalAmount, name: "目標貯蓄額", description: nil, year: nil, month: nil, totalAmount: 6000000, averageAmount: nil, loanTotalAmount: nil, interestAmount: nil, interestRate: nil)
        
        let i2 = InfoCellViewModel(type: .save, name: nil, description: nil, year: 6, month: 2, totalAmount: 1708650, averageAmount: 23564, loanTotalAmount: nil, interestAmount: nil, interestRate: nil)

        let i3 = InfoCellViewModel(type: .short, name: nil, description: nil, year: 7, month: 10, totalAmount: -4291350, averageAmount: 56129, loanTotalAmount: nil, interestAmount: nil, interestRate: nil)
        
        models = [i1, i2, i3]
    }
}

// MARK: UITableViewDataSource

extension SavingPlanViewController {
    internal override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1//models.count
    }
    
//    internal override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 36
//    }
    
//    internal override func tableView(tableView: UITableView, viewForHeaderInSection sectionIndex: Int) -> UIView? {
//        let dateModel = models[sectionIndex]
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryDateCell") as! HistoryDateCell
//        cell.setup(dateModel.date)
//        
//        return cell
//    }
    
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
            cell.setup(infoModel)
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
