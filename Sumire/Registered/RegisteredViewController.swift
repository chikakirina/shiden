//
//  RegisteredViewController.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/14.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class RegisteredViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var models: [RegisteredCardPersonViewModel] = []
    
    override func viewDidLoad() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        generateDebugData()
        tableView.reloadData()
    }
    
    private func generateDebugData() {
        let c1 = RegisteredCardViewModel(name: "イオン銀行 ガーネット支店", subName: "ヤマダタロウ", balance: 1708650, cardType: .aeonBank)
        let c2 = RegisteredCardViewModel(name: "イオンカード", subName: "1234 **** **** **** ヤマダタロウ", balance: 82085, cardType: .aeonCard)
        let c3 = RegisteredCardViewModel(name: "WAONカード", subName: "1234 5678 9012 3456", balance: 3417, cardType: .waonCard)
        let h1 = RegisteredCardPersonViewModel(name: "あなたのイオン銀行口座・WAONカード", isMe: true, cards: [c1, c2, c3])
        
        let c4 = RegisteredCardViewModel(name: "WAONカード", subName: "5678 9012 3456 7890", balance: 0, cardType: .waonCard)
        let h2 = RegisteredCardPersonViewModel(name: "父方のおじいちゃん", isMe: false, cards: [c4])

        let c5 = RegisteredCardViewModel(name: "WAONカード", subName: "9012 3456 7890 1234", balance: 0, cardType: .waonCard)
        let h3 = RegisteredCardPersonViewModel(name: "花子おばあちゃん", isMe: false, cards: [c5])
        
        models = [h1, h2, h3]
    }
}

// MARK: UITableViewDataSource

extension RegisteredViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection sectionIndex: Int) -> UIView? {
        let personModel = models[sectionIndex]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RegisteredHeaderCell") as! RegisteredHeaderCell
        cell.setup(personModel)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let personModel = models[section]
        return personModel.cards.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let personModel = models[indexPath.section]
        return personModel.isMe ? 120 : 85
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let personModel = models[indexPath.section]
        let cardModel = personModel.cards[indexPath.row]
        
        if personModel.isMe {
            let cell = tableView.dequeueReusableCellWithIdentifier("RegisteredOwnCardCell", forIndexPath: indexPath) as! RegisteredOwnCardCell
            cell.setup(cardModel)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("RegisteredOthersCardCell", forIndexPath: indexPath) as! RegisteredOthersCardCell
            cell.setup(cardModel)
            return cell
        }
    }
}