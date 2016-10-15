//
//  InfoDescriptionCell.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class InfoDescriptionCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    internal func setup(model: InfoCellViewModel) {
        nameLabel.text = model.name
        descriptionLabel.text = model.description
    }
}