//
//  ContributionViewController.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit
import SwiftDate
import Charts

class ContributionViewController: UITableViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    private var models: [ContributionCellViewModel] = []
    
    @IBAction func tapMenuButton(sender: UIBarButtonItem) {
        slideMenuController()?.openLeft()
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        generateDebugData()
        tableView.reloadData()
    }
    
    private func generateDebugData() {
        let h1 = ContributionCellViewModel(name: "母方祖父", amount: 1831400, colorInt: 0)
        let h2 = ContributionCellViewModel(name: "父方祖父", amount: 901040, colorInt: 1)
        let h3 = ContributionCellViewModel(name: "父", amount: 1323000, colorInt: 2)
        let h4 = ContributionCellViewModel(name: "イオン", amount: 427600, colorInt: 3)
        let h5 = ContributionCellViewModel(name: "母方祖母", amount: 332200, colorInt: 4)
        
        models = [h1, h2, h3, h4, h5].sort { $0.amount > $1.amount }
        
        setupGraphStyle(pieChartView)
        pieChartView.data = generateGraphData()
    }
}

// MARK: Private for PieChart

extension ContributionViewController {
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
        
        let totalAmount = models.reduce(0) { $0 + $1.amount }
        
        _ = models.enumerate().map { index, personModel in
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
