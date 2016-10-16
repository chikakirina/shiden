//
//  HomeViewController.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/13.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit
import SwiftDate
import Charts

class HomeViewController: UITableViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    
    private var models: [HistoriesDateModel] = []
    
    @IBAction func tapMenuButton(sender: UIBarButtonItem) {
        slideMenuController()?.openLeft()
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        generateDebugData()
        tableView.reloadData()
        
        setupGraphStyle(barChartView)
        barChartView.data = generateGraphData()
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

// MARK: Private for BarChart

extension HomeViewController {
    private func setupGraphStyle(barChartView: BarChartView) {
        barChartView.leftAxis.labelCount = 3
        barChartView.leftAxis.axisMaxValue = 30000
        barChartView.leftAxis.axisMinValue = 0
        barChartView.leftAxis.labelTextColor = UIColor(white: 1, alpha: 0.5)
        barChartView.leftAxis.labelFont = UIFont(name: "HelveticaNeue", size: 8)!
        barChartView.leftAxis.gridColor = UIColor(white: 1, alpha: 0.5)
        
        barChartView.rightAxis.enabled = false
        
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.xAxis.labelTextColor = UIColor(white: 1, alpha: 0.5)
        barChartView.xAxis.labelFont = UIFont(name: "HelveticaNeue", size: 8)!
        barChartView.xAxis.gridColor = UIColor.clearColor()
        
        barChartView.legend.enabled = false
        barChartView.highlightPerTapEnabled = true
        barChartView.noDataText = "データがありません"
        barChartView.descriptionText = ""
        barChartView.userInteractionEnabled = false
    }
    
    private func generateGraphData() -> BarChartData? {
        var colors: [UIColor] = []
        var xVals: [String] = []
        var yVals: [BarChartDataEntry] = []
        
        _ = (1..<31).map { index in
            colors.append(UIColor.whiteColor())
            xVals.append("\(index)日")
            let dataEntry = index < 12 ? BarChartDataEntry(value: 1000 * Double(index) * Double(95 + arc4random() % 10) / 100, xIndex: index) : BarChartDataEntry(value: 0, xIndex: index)
            yVals.append(dataEntry)
        }
        
        let dataSet = BarChartDataSet(yVals: yVals, label: "")
        dataSet.valueFont = UIFont.systemFontOfSize(12)
        dataSet.drawValuesEnabled = false
        dataSet.colors = colors
        let data = BarChartData(xVals: xVals, dataSet: dataSet)
        data.setDrawValues(false)
        
        return data
    }
}

// MARK: UITableViewDataSource

extension HomeViewController {
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