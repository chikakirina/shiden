//
//  Label.swift
//  Sumire
//
//  Created by koutalou on 2016/10/15.
//  Copyright © 2016年 koutalou. All rights reserved.
//

import UIKit

public class RoundedLabel: UILabel {
    let paddingEdgeInsets = UIEdgeInsets(top: 1, left: 4, bottom: 1, right: 4)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func drawTextInRect(rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, paddingEdgeInsets)
        super.drawTextInRect(newRect)
    }
    
    override public func intrinsicContentSize() -> CGSize {
        var intrinsicContentSize = super.intrinsicContentSize()
        intrinsicContentSize.height += paddingEdgeInsets.top + paddingEdgeInsets.bottom
        intrinsicContentSize.width += paddingEdgeInsets.left + paddingEdgeInsets.right
        return intrinsicContentSize
    }
}