//
//  ContributionCellViewModel.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

public struct ContributionCellViewModel {
    var name: String
    var amount: Int
    var color: UIColor
    
    public init(name: String, amount: Int, colorInt: Int) {
        self.name = name
        self.amount = amount
        self.color = ContributionCellViewModel.getColor(colorInt)
    }
    
    private static func getColor(colorInt: Int) -> UIColor {
        switch colorInt {
        case 0:
            return color(red: 26, green: 158, blue: 214)
        case 1:
            return color(red: 51, green: 198, blue: 214)
        case 2:
            return color(red: 22, green: 184, blue: 146)
        case 3:
            return color(red: 170, green: 24, blue: 122)
        case 4:
            return color(red: 103, green: 190, blue: 78)
        default:
            return color(red: 26, green: 158, blue: 214)
        }
    }
    
    private static func color(red red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
}