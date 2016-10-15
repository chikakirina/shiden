//
//  Double+Utility.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import Foundation

public extension Double {
    func toNumberFormatString() -> String {
        var value = fabs(self)
        if value > 999999999999 {
            value = 0
        }
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "ja_JP")
        return formatter.stringFromNumber(value) ?? "0"
    }
}
