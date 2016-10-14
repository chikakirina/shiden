//
//  HistorySavingCell.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/14.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class HistorySavingCell: UITableViewCell {
    
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var savingAmountLabel: UILabel!
    
    internal func setup(model: HistoryCellViewModel) {
        shopNameLabel.text = model.storeName
        savingAmountLabel.text = model.savingAmount.toNumberFormatString()
    }
}