//
//  LeftMenuViewController.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/14.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
    case home = 0
    case transactions
    case savingPlan
    case paymentPlan
    case registeredInfo
    case faq
    case setting
    case logout
}

protocol LeftMenuProtocol : class {
    func changeViewController(menu: LeftMenu)
}

class LeftMenuViewController : UIViewController, LeftMenuProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var menus = ["ホーム", "入金履歴", "貯蓄目標", "将来の返済計画", "イオン銀行・WAONカード","FAQ","設定","ログアウト"]
    var homeViewController: UIViewController!
    var transactionsViewController: UIViewController!
    var savingPlanViewController: UIViewController!
    var paymentPlanViewControlelr: UIViewController!
    var registeredInfoViewController: UIViewController!
    var faqViewController: UIViewController!
    var settingViewController: UIViewController!
    
    var selectedMenu: LeftMenu = .home
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Remove the UITableViewCell separator for empty cells
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
//        self.tableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let swiftViewController = storyboard.instantiateViewController(withIdentifier: "SwiftViewController") as! SwiftViewController
//        self.swiftViewController = UINavigationController(rootViewController: swiftViewController)
//        
//        let javaViewController = storyboard.instantiateViewController(withIdentifier: "JavaViewController") as! JavaViewController
//        self.javaViewController = UINavigationController(rootViewController: javaViewController)
//        
//        let goViewController = storyboard.instantiateViewController(withIdentifier: "GoViewController") as! GoViewController
//        self.goViewController = UINavigationController(rootViewController: goViewController)
//        
//        let nonMenuController = storyboard.instantiateViewController(withIdentifier: "NonMenuController") as! NonMenuController
//        nonMenuController.delegate = self
//        self.nonMenuViewController = UINavigationController(rootViewController: nonMenuController)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func changeViewController(menu: LeftMenu) {
//        switch menu {
//        case .main:
//            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
//        case .swift:
//            self.slideMenuController()?.changeMainViewController(self.swiftViewController, close: true)
//        case .java:
//            self.slideMenuController()?.changeMainViewController(self.javaViewController, close: true)
//        case .go:
//            self.slideMenuController()?.changeMainViewController(self.goViewController, close: true)
//        case .nonMenu:
//            self.slideMenuController()?.changeMainViewController(self.nonMenuViewController, close: true)
//        }
    }
}

extension LeftMenuViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
            
            // Update Selected Menu
            selectedMenu = menu
            tableView.reloadData()
        }
    }
}

extension LeftMenuViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LeftMenuCell", forIndexPath: indexPath) as! LeftMenuCell
        let selected = LeftMenu(rawValue: indexPath.row) == selectedMenu
        cell.setup(name: menus[indexPath.row], isSelected: selected)
        
        if menus.count - 1 == indexPath.row {
            cell.setRedColor()
        }
        
        return cell
    }
}
