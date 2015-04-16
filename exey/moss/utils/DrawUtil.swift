//
//  DrawUtil.swift
//  Created by Exey Panteleev on 01/02/15.
//

import UIKit

public struct DrawUtil {

    /** Use inside drawRect() */
    static func lineWithUIKit(color:UIColor, rect:CGRect) {
        color.setFill()
        UIRectFill(rect)
    }

}