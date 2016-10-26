//
//  ProgressMonthCell.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/26.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class ProgressMonthCell: UITableViewCell {
    
    @IBOutlet weak var saveTotalAmountLabel: UILabel!
    @IBOutlet weak var restAmountLabel: UILabel!
    @IBOutlet weak var saveAmountPerMonthLabel: UILabel!
    
    internal func setup(model: InfoCellViewModel) {
        saveTotalAmountLabel.text = model.totalAmount?.toNumberFormatString()
        restAmountLabel.text = model.loanTotalAmount?.toNumberFormatString()
        saveAmountPerMonthLabel.text = model.interestAmount?.toNumberFormatString()
    }
}