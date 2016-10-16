//
//  StartDemographicViewController.swift
//  
//
//  Created by koutalou on 2016/10/16.
//
//

import UIKit
import ActionSheetPicker_3_0
import SwiftDate

class StartDemographicViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var amountLabel: UILabel!
    
    var selectedDate: NSDate?
    var selectedIsNationalOrPublic: Bool?
    var selectedIsHomeCommute: Bool?
    var settings = ["生年月日","進学区分","通学"]
    
    @IBAction func tapMenuButton(sender: UIBarButtonItem) {
        slideMenuController()?.openLeft()
    }
    
    override func viewDidLoad() {
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func tapNextButton(sender: UIButton) {
        performSegueWithIdentifier("SettingNext", sender: nil)
    }
    
    private func reloadView() {
        tableView.reloadData()
        
        guard let _ = selectedDate, isNational = selectedIsNationalOrPublic, isHome = selectedIsHomeCommute else {
            amountLabel.text = "- 円"
            return
        }
        
        switch (isNational, isHome) {
        case (true, true):
            amountLabel.text = "5,000,000 円"
        case (false, true):
            amountLabel.text = "7,000,000 円"
        case (true, false):
            amountLabel.text = "10,000,000 円"
        case (false, false):
            amountLabel.text = "12,000,000 円"
        default:
            break
        }
    }
    
    private func selectDate() {
        let preDate = selectedDate ?? NSDate.init(year: 2010, month: 1, day: 1)
        
        ActionSheetDatePicker.showPickerWithTitle("生年月日の選択", datePickerMode: .Date, selectedDate: preDate, doneBlock: { (picker, date, value) in
                print("done date:\(date)")
                self.selectedDate = date as? NSDate
                self.reloadView()
            }, cancelBlock: { picker in
                print("cancel")
            }, origin: view)
    }
    
    private func selectNationalOrPublic() {
        let preSelect = selectedIsNationalOrPublic ?? true ? 0 : 1
        
        ActionSheetStringPicker.showPickerWithTitle("進学区分の選択", rows: ["国公立","私立"], initialSelection: preSelect, doneBlock: { (picker, index, value) in
                print("done index:\(index)")
                self.selectedIsNationalOrPublic = index == 0 ? true : false
                self.reloadView()
            }, cancelBlock: { picker in
                print("cancel")
            }, origin: view)
    }
    
    private func selectHomeCommute() {
        let preSelect = selectedIsHomeCommute ?? true ? 0 : 1
        
        ActionSheetStringPicker.showPickerWithTitle("通学の選択", rows: ["自宅","下宿"], initialSelection: preSelect, doneBlock: { (picker, index, value) in
                print("done index:\(index)")
                self.selectedIsHomeCommute = index == 0 ? true : false
                self.reloadView()
            }, cancelBlock: { picker in
                print("cancel")
            }, origin: view)
    }
}

// MARK: UITableViewDelegate

extension StartDemographicViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Deselect
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            selectDate()
        case 1:
            selectNationalOrPublic()
        case 2:
            selectHomeCommute()
        default:
            break
        }
    }
}

// MARK: UITableViewDataSource

extension StartDemographicViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settings[section]
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//settings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let settingName = settings[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("SettingCell", forIndexPath: indexPath) as! SettingCell
        
        cell.nameLabel.text = ""
        
        switch indexPath.section {
        case 0:
            guard let selectedDate = selectedDate else {
                cell.valueLabel.text = "未設定"
                return cell
            }
            let dateFormatter = StandardDateFormatter(dateFormat: "yyyy年MM月dd日", locale: .enUSPOSIX, calendar: .gregorian)
            cell.valueLabel.text = dateFormatter.string(selectedDate)
            return cell
        case 1:
            guard let selectedIsNationalOrPublic = selectedIsNationalOrPublic else {
                cell.valueLabel.text = "未設定"
                return cell
            }
            cell.valueLabel.text = selectedIsNationalOrPublic ? "国公立" : "私立"
            return cell
        case 2:
            guard let selectedIsHomeCommute = selectedIsHomeCommute else {
                cell.valueLabel.text = "未設定"
                return cell
            }
            cell.valueLabel.text = selectedIsHomeCommute ? "自宅" : "下宿"
            return cell
        default:
            return cell
        }
    }
}
