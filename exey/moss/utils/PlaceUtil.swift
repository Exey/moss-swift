//
//  PlaceUtil.swift
//  Created by Exey Panteleev
//

import UIKit

struct PlaceUtil {
    
    static func scaleTo(view:UIView, ratio:CGFloat) {
        let t = CGAffineTransformScale(view.transform, ratio, ratio)
        view.transform = t
    }
    
}