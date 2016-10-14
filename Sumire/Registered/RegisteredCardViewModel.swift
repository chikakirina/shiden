//
//  RegisteredCardViewModel.swift
//  Sumire
//
//  Created by Kodama.Kotaro on 2016/10/14.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import Foundation

enum CardType {
    case aeonBank
    case aeonCard
    case waonCard
}

public struct RegisteredCardPersonViewModel {
    var name: String
    var isMe: Bool
    var cards: [RegisteredCardViewModel]
}

public struct RegisteredCardViewModel {
    var name: String
    var subName: String
    var balance: Int
    var cardType: CardType
}