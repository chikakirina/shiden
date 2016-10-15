//
//  InfoSaveCell.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class InfoSaveCell: UITableViewCell {
    
    @IBOutlet weak var saveTotalAmountLabel: UILabel!
    @IBOutlet weak var periodYearLabel: UILabel!
    @IBOutlet weak var periodMonthLabel: UILabel!
    @IBOutlet weak var averageSaveAmountPerMonthLabel: UILabel!
    
    internal func setup(model: InfoCellViewModel) {
        saveTotalAmountLabel.text = model.totalAmount?.toNumberFormatString()
        periodYearLabel.text = model.year?.toNumberFormatString()
        periodMonthLabel.text = model.month?.toNumberFormatString()
        averageSaveAmountPerMonthLabel.text = model.averageAmount?.toNumberFormatString()
    }
}