//
//  ContributionCell.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class ContributionCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var colorCirculeView: UIView!
    
    internal func setup(model: ContributionCellViewModel) {
        nameLabel.text = model.name
        amountLabel.text = model.amount.toNumberFormatString()
        
        colorCirculeView.backgroundColor = model.color
    }
}