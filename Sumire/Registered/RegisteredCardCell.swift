//
//  RegisteredCardCell.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/14.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

class RegisteredHeaderCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    internal func setup(model: RegisteredCardPersonViewModel) {
        nameLabel.text = model.name
    }
}

class RegisteredOwnCardCell: UITableViewCell {
    @IBOutlet weak var backgroundCardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    internal func setup(model: RegisteredCardViewModel) {
        nameLabel.text = model.name
        subNameLabel.text = model.subName
        balanceLabel.text = model.balance.toNumberFormatString()
        
        switch model.cardType {
        case .aeonBank:
            backgroundCardView.backgroundColor = UIColor(colorLiteralRed: 170/255.0, green: 24/255.0, blue: 122/255.0, alpha: 1)
        case .aeonCard:
            backgroundCardView.backgroundColor = UIColor(colorLiteralRed: 86/255.0, green: 93/255.0, blue: 157/255.0, alpha: 1)
        case .waonCard:
            backgroundCardView.backgroundColor = UIColor(colorLiteralRed: 144/255.0, green: 192/255.0, blue: 214/255.0, alpha: 1)
        }
    }
}

class RegisteredOthersCardCell: UITableViewCell {
    @IBOutlet weak var backgroundCardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subNameLabel: UILabel!
    
    internal func setup(model: RegisteredCardViewModel) {
        nameLabel.text = model.name
        subNameLabel.text = model.subName
        
        switch model.cardType {
        case .aeonBank:
            backgroundCardView.backgroundColor = UIColor(colorLiteralRed: 170/255.0, green: 24/255.0, blue: 122/255.0, alpha: 1)
        case .aeonCard:
            backgroundCardView.backgroundColor = UIColor(colorLiteralRed: 86/255.0, green: 93/255.0, blue: 157/255.0, alpha: 1)
        case .waonCard:
            backgroundCardView.backgroundColor = UIColor(colorLiteralRed: 144/255.0, green: 192/255.0, blue: 214/255.0, alpha: 1)
        }
    }
}