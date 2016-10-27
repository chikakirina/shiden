//
//  LeftMenuViewController.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/14.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

enum LeftMenu: String {
    case home = "Home"
    case transactions = "入金履歴"
    case progressTheMonth = "今月の累計イオン利用額"
    case savingPlan = "貯蓄目標"
    case paybackPlan = "将来の返済計画"
    case registeredInfo = "イオン銀行・WAONカード"
    case contribution = "貢献度"
    case faq = "FAQ"
    case setting = "設定"
    case logout = "ログアウト"
}

protocol LeftMenuProtocol : class {
    func changeViewController(menu: LeftMenu)
}

class LeftMenuViewController : UIViewController, LeftMenuProtocol {
        
    @IBOutlet weak var tableView: UITableView!
    var menus: [LeftMenu] = [.home, .transactions, .progressTheMonth, .savingPlan, .paybackPlan, .registeredInfo, .contribution, .faq, .setting, .logout]
    var homeViewController: UIViewController!
    var transactionsViewController: UIViewController!
    var progressMonthViewController: UIViewController!
    var savingPlanViewController: UIViewController!
    var paybackPlanViewControlelr: UIViewController!
    var registeredNavigationController: UIViewController!
    var contributionNavigationController: UIViewController!
    var faqViewController: UIViewController!
    var settingViewController: UIViewController!
    
    var selectedMenu: LeftMenu = .home
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set SharedInstance
        SharedInstanceManager.instance.leftMenuViewController = self
        
        //Remove the UITableViewCell separator for empty cells
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        registeredNavigationController = UIStoryboard(name: "Registered", bundle: nil).instantiateInitialViewController()
        transactionsViewController = UIStoryboard(name: "Transactions", bundle: nil).instantiateInitialViewController()
        progressMonthViewController = UIStoryboard(name: "ProgressMonth", bundle: nil).instantiateInitialViewController()
        savingPlanViewController = UIStoryboard(name: "SavingPlan", bundle: nil).instantiateInitialViewController()
        paybackPlanViewControlelr = UIStoryboard(name: "Payback", bundle: nil).instantiateInitialViewController()
        contributionNavigationController = UIStoryboard(name: "Contribution", bundle: nil).instantiateInitialViewController()

        settingViewController = UIStoryboard(name: "Start", bundle: nil).instantiateInitialViewController()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    internal func changeViewController(menu: LeftMenu) {
        switch menu {
        case .home:
            slideMenuController()?.changeMainViewController(homeViewController, close: true)
        case .transactions:
            slideMenuController()?.changeMainViewController(transactionsViewController, close: true)
        case .registeredInfo:
            slideMenuController()?.changeMainViewController(registeredNavigationController, close: true)
        case .savingPlan:
            slideMenuController()?.changeMainViewController(savingPlanViewController, close: true)
        case .paybackPlan:
            slideMenuController()?.changeMainViewController(paybackPlanViewControlelr, close: true)
        case .contribution:
            slideMenuController()?.changeMainViewController(contributionNavigationController, close: true)
        case .setting:
            slideMenuController()?.changeMainViewController(settingViewController, close: true)
        case .progressTheMonth:
            slideMenuController()?.changeMainViewController(progressMonthViewController, close: true)
        default:
            break
        }
        
        // Update Selected Menu
        selectedMenu = menu
        tableView.reloadData()
    }
}

extension LeftMenuViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let menu = menus[indexPath.row]
        self.changeViewController(menu)
    }
}

extension LeftMenuViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LeftMenuCell", forIndexPath: indexPath) as! LeftMenuCell
        let selected = menus[indexPath.row] == selectedMenu
        cell.setup(name: menus[indexPath.row].rawValue, isSelected: selected)
        
        if menus.count - 1 == indexPath.row {
            cell.setRedColor()
        }
        
        return cell
    }
}
