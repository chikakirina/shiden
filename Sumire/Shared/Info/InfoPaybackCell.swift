//
//  InfoPaybackCell.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class InfoPaybackCell: UITableViewCell {
    
    @IBOutlet weak var paybackTotalAmountLabel: UILabel!
    @IBOutlet weak var loanTotalAmountLabel: UILabel!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var interestRateLabel: UILabel!
    
    internal func setup(model: InfoCellViewModel) {
        paybackTotalAmountLabel.text = model.totalAmount?.toNumberFormatString()
        loanTotalAmountLabel.text = model.loanTotalAmount?.toNumberFormatString()
        interestLabel.text = model.interestAmount?.toNumberFormatString()
        interestRateLabel.text = ((model.interestRate ?? 0) * 100).toNumberFormatString()
    }
}
