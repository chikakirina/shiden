//
//  HistoryShoppingCell.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/13.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class HistoryShoppingCell: UITableViewCell {
    
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var purchaseAmountLabel: UILabel!
    @IBOutlet weak var savingAmountLabel: UILabel!
    
    internal func setup(model: HistoryCellViewModel) {
        shopNameLabel.text = model.storeName
        savingAmountLabel.text = model.savingAmount.toNumberFormatString()
        purchaseAmountLabel.text = model.purchaseAmount.toNumberFormatString()
    }
}