//
//  BurdenSettingViewController.swift
//  Sumire
//
//  Created by koutalou on 2016/10/16.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class BurdenSettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections = ["負担率の設定","負担予測"]
    var selectedBurdenRateIndex: Int?
    var burdenRates: [Int]!
    
    override func viewDidLoad() {
        burdenRates = (1...20).map { $0 * 5 }
    }
    
    @IBAction func tapStartButton(sender: UIButton) {
        SharedInstanceManager.instance.leftMenuViewController?.changeViewController(.home)
        navigationController?.popViewControllerAnimated(true)
    }
    
    private func selectRate() {
        let preSelect = selectedBurdenRateIndex ?? sections.count - 1
        
        ActionSheetStringPicker.showPickerWithTitle("負担率の選択", rows: burdenRates.map{"\($0)%"}, initialSelection: preSelect, doneBlock: { (picker, index, value) in
            self.selectedBurdenRateIndex = index
            self.tableView.reloadData()
            }, cancelBlock: { picker in
            }, origin: view)
    }
}

extension BurdenSettingViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Deselect
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            selectRate()
        default:
            break
        }
    }
}

// MARK: UITableViewDataSource

extension BurdenSettingViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        guard let _ = selectedBurdenRateIndex else {
            return 44
        }
        return indexPath.section == 0 ? 44 : 300
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let settingName = settings[indexPath.row]
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("SettingCell", forIndexPath: indexPath) as! SettingCell
            
            cell.nameLabel.text = ""
            guard let selectedBurdenRateIndex = selectedBurdenRateIndex else {
                cell.valueLabel.text = "未設定"
                return cell
            }
            cell.valueLabel.text = "\(burdenRates[selectedBurdenRateIndex])%"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("BurdenResultCell", forIndexPath: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
}