//
//  InfoAmountCell.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class InfoAmountCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountSafixLabel: UILabel?
    
    internal func setup(model: InfoCellViewModel) {
        nameLabel.text = model.name
        amountLabel.text = model.totalAmount?.toNumberFormatString()
    }
    
    internal func setup(model: InfoCellViewModel, amountSafix: String) {
        nameLabel.text = model.name
        amountLabel.text = model.totalAmount?.toNumberFormatString()
        amountSafixLabel?.text = amountSafix
    }
}