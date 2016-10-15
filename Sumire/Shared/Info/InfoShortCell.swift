//
//  InfoShortCell.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class InfoShortCell: UITableViewCell {
    
    @IBOutlet weak var lackAmountLabel: UILabel!
    @IBOutlet weak var restYearLabel: UILabel!
    @IBOutlet weak var restMonthLabel: UILabel!
    @IBOutlet weak var averageSaveAmountPerMonthLabel: UILabel!
    
    internal func setup(model: InfoCellViewModel) {
        lackAmountLabel.text = model.totalAmount?.toNumberFormatString()
        restYearLabel.text = model.year?.toNumberFormatString()
        restMonthLabel.text = model.month?.toNumberFormatString()
        averageSaveAmountPerMonthLabel.text = model.averageAmount?.toNumberFormatString()
    }
}