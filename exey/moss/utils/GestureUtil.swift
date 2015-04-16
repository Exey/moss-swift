//
//  GestureUtil.swift
//  Blandly
//
//  Created by Exey on 14/09/14.
//  Copyright (c) 2014 MPL. All rights reserved.
//

import Foundation
import UIKit
public struct GestureUtil {
    
    static public func addTap(tappable:UIView, target:AnyObject, action:Selector)->UITapGestureRecognizer {
        let recognizer = UITapGestureRecognizer(target: target, action:action)
        tappable.addGestureRecognizer(recognizer)
        return recognizer
    }
}