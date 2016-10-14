//
//  LeftMenuCell.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/14.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

public class LeftMenuCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    public func setup(name name: String, isSelected: Bool) {
        nameLabel.text = name
        nameLabel.textColor = isSelected ? UIColor(colorLiteralRed: 170/255.0, green: 24/255.0, blue: 122/255.0, alpha: 1) : UIColor(colorLiteralRed: 61/255.0, green: 66/255.0, blue: 72/255.0, alpha: 1)
    }
    
    public func setRedColor() {
        nameLabel.textColor = UIColor.redColor()
    }
}