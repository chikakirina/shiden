//
//  HistoryDateCell.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/14.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class HistoryDateCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    internal func setup(date: NSDate) {
        let dateFormatter = StandardDateFormatter(dateFormat: "yyyy年MM月dd日(E)", locale: .enUSPOSIX, calendar: .gregorian)
        dateLabel.text = dateFormatter.string(date)
    }
}