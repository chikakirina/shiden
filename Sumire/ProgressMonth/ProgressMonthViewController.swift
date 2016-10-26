//
//  ProgressMonthViewController.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/26.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit
import SwiftDate
import Charts

public class ProgressMonthViewController: UITableViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    private var graphModels: [ContributionCellViewModel] = []
    private var listModels: [InfoCellViewModel] = []
    
    @IBAction func tapMenuButton(sender: UIBarButtonItem) {
        slideMenuController()?.openLeft()
    }
    
    override public func viewDidLoad() {
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
//        navigationController?.navigationBar.shadowImage = UIImage()
        
        generateDebugData()
        tableView.reloadData()
    }
    
    private func generateDebugData() {
        let i1 = InfoCellViewModel(type: .save, name: nil, description: nil, year: nil, month: nil, totalAmount: 45213, averageAmount: nil, loanTotalAmount: 4787, interestAmount: 4000, interestRate: nil)

        listModels = [i1]
        
        let h1 = ContributionCellViewModel(name: "貯蓄額", amount: 45213, colorInt: 0)
        let h2 = ContributionCellViewModel(name: "不足額", amount: 4787, colorInt: 5)
        
        graphModels = [h1, h2].sort { $0.amount > $1.amount }
        
        setupGraphStyle(pieChartView)
        pieChartView.data = generateGraphData()
    }
}

// MARK: Private for PieChart

extension ProgressMonthViewController {
    private func setupGraphStyle(pieChartView: PieChartView) {
        pieChartView.usePercentValuesEnabled = false
        pieChartView.rotationEnabled = false
        //pieChartView.holeTransparent = true
        pieChartView.holeRadiusPercent = 0.0
        pieChartView.transparentCircleRadiusPercent = 0.0
        pieChartView.descriptionText = ""
        
        pieChartView.drawCenterTextEnabled = true
        
        pieChartView.drawHoleEnabled = true
        //pieChartView.holeAlpha = 0
        pieChartView.holeColor = UIColor.clearColor()
        pieChartView.rotationAngle = 270.0
        pieChartView.rotationEnabled = true
        pieChartView.legend.enabled = false
        pieChartView.highlightPerTapEnabled = true
        pieChartView.noDataText = "データがありません"
        pieChartView.userInteractionEnabled = false
    }
    
    private func generateGraphData() -> PieChartData? {
        var colors: [UIColor] = []
        var xVals: [String] = []
        var yVals: [BarChartDataEntry] = []
        
        let totalAmount = graphModels.reduce(0) { $0 + $1.amount }
        
        _ = graphModels.enumerate().map { index, personModel in
            colors.append(personModel.color)
            xVals.append(personModel.name)
            let dataEntry = BarChartDataEntry(value: Double(personModel.amount) / Double(totalAmount) * 100, xIndex: index)
            yVals.append(dataEntry)
        }
        
        let dataSet = PieChartDataSet(yVals: yVals, label: "")
        dataSet.sliceSpace = 1
        dataSet.valueFont = UIFont.systemFontOfSize(12)
        dataSet.drawValuesEnabled = false
        dataSet.colors = colors
        let data = PieChartData(xVals: xVals, dataSet: dataSet)
        data.setDrawValues(false)
        
        return data
    }
}

// MARK: UITableViewDataSource

extension ProgressMonthViewController {
    public override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    public override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 190
    }
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModels.count
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let model = listModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ProgressMonth", forIndexPath: indexPath) as! ProgressMonthCell
        cell.setup(model)
        return cell
    }
}