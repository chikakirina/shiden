//
//  InfoCellViewModel.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

enum InfoType {
    case normalAmount
    case description
    case save
    case short
    case payback
}

public struct InfoCellViewModel {
    var type: InfoType
    var name: String?
    var description: String?
    var year: Int?
    var month: Int?
    var totalAmount: Int?
    var averageAmount: Int?
    var loanTotalAmount: Int?
    var interestAmount: Int?
    var interestRate: Double?
}