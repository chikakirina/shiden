//
//  SharedInstanceManager.swift
//  Sumire
//
//  Created by koutalou on 2016/10/16.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import Foundation

public class SharedInstanceManager {
    static let instance = SharedInstanceManager()
    
    internal var leftMenuViewController: LeftMenuViewController?
}