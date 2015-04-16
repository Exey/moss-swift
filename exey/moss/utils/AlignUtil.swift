//
//  AlignUtil.swift
//  Created by Exey Panteleev
//

import Foundation

struct AlignUtil {
    
    static func horizontalCenter(view:UIView, parentFrame:CGRect)->CGFloat {
        let center = (parentFrame.width-view.frame.width)/2
        view.frame.origin.x = center
        return center
    }
    
}