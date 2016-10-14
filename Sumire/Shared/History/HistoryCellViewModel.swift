//
//  HistoryCellViewModel.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/13.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

public struct HistoryCellViewModel {
    var storeName: String
    var purchaseAmount: Int
    var savingAmount: Int
    var isShopping: Bool
    var isAeon: Bool
}

public struct HistoriesDateModel {
    var date: NSDate
    var histories: [HistoryCellViewModel]
}