//
//  Int+Utility.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/13.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import Foundation

public extension Int {
    func toNumberFormatString() -> String {
        var value = abs(self)
        if value > 999999999999 {
            value = 0
        }
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "ja_JP")
        return formatter.stringFromNumber(value) ?? "0"
    }
}
