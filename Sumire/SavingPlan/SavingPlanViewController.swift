//
//  SavingPlanViewController.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit
import SwiftDate
import Charts

class SavingPlanViewController: UITableViewController {
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    
    private var models: [InfoCellViewModel] = []
    
    override func viewDidLoad() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        generateDebugData()
        tableView.reloadData()
        
        setupGraphStyle(lineChartView)
        lineChartView.data = generateGraphData()
    }
    
    private func generateDebugData() {
        let i1 = InfoCellViewModel(type: .normalAmount, name: "目標貯蓄額", description: nil, year: nil, month: nil, totalAmount: 6000000, averageAmount: nil, loanTotalAmount: nil, interestAmount: nil, interestRate: nil)
        
        let i2 = InfoCellViewModel(type: .save, name: nil, description: nil, year: 6, month: 2, totalAmount: 1708650, averageAmount: 23564, loanTotalAmount: nil, interestAmount: nil, interestRate: nil)

        let i3 = InfoCellViewModel(type: .short, name: nil, description: nil, year: 7, month: 10, totalAmount: -4291350, averageAmount: 56129, loanTotalAmount: nil, interestAmount: nil, interestRate: nil)
        
        models = [i1, i2, i3]
    }
}

// MARK: Private for LineChart

extension SavingPlanViewController {
    private func setupGraphStyle(lineChartView: LineChartView) {
        lineChartView.leftAxis.labelCount = 6
        lineChartView.leftAxis.axisMaxValue = 600
        lineChartView.leftAxis.axisMinValue = 0
        lineChartView.leftAxis.labelTextColor = UIColor(white: 1, alpha: 0.5)
        lineChartView.leftAxis.labelFont = UIFont(name: "HelveticaNeue", size: 8)!
        lineChartView.leftAxis.gridColor = UIColor(white: 1, alpha: 0.5)
        
        lineChartView.rightAxis.enabled = false
        
        lineChartView.xAxis.labelPosition = .Bottom
        lineChartView.xAxis.labelTextColor = UIColor(white: 1, alpha: 0.5)
        lineChartView.xAxis.labelFont = UIFont(name: "HelveticaNeue", size: 8)!
        lineChartView.xAxis.gridColor = UIColor.clearColor()
        
        lineChartView.legend.enabled = false
        lineChartView.highlightPerTapEnabled = true
        lineChartView.noDataText = "データがありません"
        lineChartView.descriptionText = ""
        lineChartView.userInteractionEnabled = false
    }
    
    private func generateGraphData() -> LineChartData? {
        var colors: [UIColor] = []
        var xVals: [String] = []
        var yFillVals: [ChartDataEntry] = []
        var yLineVals: [ChartDataEntry] = []
        
        _ = (0..<19).map { index in
            colors.append(UIColor.clearColor())
            xVals.append("\(index )年")
            let dataEntry = ChartDataEntry(value: Double(index) * 600 / 23 * Double(95 + arc4random() % 10) / 100, xIndex: index)
            
            // 7年目までしか支払い実績なしの想定
            if index < 8 {
                yFillVals.append(dataEntry)
                yLineVals.append(dataEntry)
            }
        }
        
        yLineVals.append(ChartDataEntry(value: 600, xIndex: 18))
        
        let dataSetFill = LineChartDataSet(yVals: yFillVals, label: "")
        dataSetFill.valueFont = UIFont.systemFontOfSize(12)
        dataSetFill.drawValuesEnabled = false
        dataSetFill.colors = colors
        
        dataSetFill.fillAlpha = 1
        dataSetFill.fillColor = UIColor(white: 1, alpha: 0.75)
        dataSetFill.drawFilledEnabled = true
        
        dataSetFill.circleColors = colors
        dataSetFill.drawCirclesEnabled = false
        
        let dataSetLine = LineChartDataSet(yVals: yLineVals, label: "")
        dataSetLine.drawValuesEnabled = false
        dataSetLine.colors = (0..<19).map { _ in UIColor(white: 1, alpha: 0.5) }
        
        dataSetLine.circleColors = colors
        dataSetLine.drawCirclesEnabled = false
        
        let data = LineChartData(xVals: xVals, dataSets: [dataSetFill, dataSetLine])
        data.setDrawValues(false)
        
        return data
    }
}

// MARK: UITableViewDataSource

extension SavingPlanViewController {
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
