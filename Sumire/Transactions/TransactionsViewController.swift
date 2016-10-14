//
//  TransactionsViewController.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/14.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit
import SwiftDate

class TransactionsViewController: UITableViewController {
    
    private var models: [HistoriesDateModel] = []
    
    override func viewDidLoad() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        generateDebugData()
        tableView.reloadData()
    }
    
    private func generateDebugData() {
        var histories: [HistoryCellViewModel]
        histories = [
            HistoryCellViewModel(storeName: "イオン東雲店", purchaseAmount: 3208, savingAmount: 32, isShopping: true, isAeon: true)
        ]
        let d1 = HistoriesDateModel(date: NSDate(year: 2016, month: 10, day: 16), histories: histories)
        
        histories = [
            HistoryCellViewModel(storeName: "まいばすけっと青山一丁目店", purchaseAmount: 1542, savingAmount: 15, isShopping: true, isAeon: false)
        ]
        let d2 = HistoriesDateModel(date: NSDate(year: 2016, month: 10, day: 12), histories: histories)
        
        histories = [
            HistoryCellViewModel(storeName: "イオン銀行 イオンモール北戸田店", purchaseAmount: 0, savingAmount: 10000, isShopping: false, isAeon: true)
        ]
        let d3 = HistoriesDateModel(date: NSDate(year: 2016, month: 10, day: 9), histories: histories)
        
        histories = [
            HistoryCellViewModel(storeName: "イオン品川シーサイド", purchaseAmount: 4621, savingAmount: 46, isShopping: true, isAeon: true)
        ]
        let d4 = HistoriesDateModel(date: NSDate(year: 2016, month: 10, day: 7), histories: histories)
        
        models = [d1, d2, d3, d4]
    }
}

// MARK: UITableViewDataSource

extension TransactionsViewController {
    internal override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return models.count
    }
    
    internal override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    internal override func tableView(tableView: UITableView, viewForHeaderInSection sectionIndex: Int) -> UIView? {
        let dateModel = models[sectionIndex]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryDateCell") as! HistoryDateCell
        cell.setup(dateModel.date)
        
        return cell
    }
    
    internal override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    internal override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dateModel = models[section]
        return dateModel.histories.count
    }
    
    internal override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let dateModel = models[indexPath.section]
        let historyModel = dateModel.histories[indexPath.row]
        
        if historyModel.isShopping {
            let cell = tableView.dequeueReusableCellWithIdentifier("HistoryShoppingCell", forIndexPath: indexPath) as! HistoryShoppingCell
            cell.setup(historyModel)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("HistorySavingCell", forIndexPath: indexPath) as! HistorySavingCell
            cell.setup(historyModel)
            return cell
        }
    }
}