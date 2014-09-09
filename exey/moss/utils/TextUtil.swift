//
//  TextUtil
//  Created by Exey Panteleev on 29/08/14.
//

import Foundation
import UIKit

public struct TextUtil {
    
    static public func getAttributes(font:UIFont, color:UIColor, align:NSTextAlignment) -> [NSObject : AnyObject]! {
        let paragraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
        paragraphStyle.alignment = align
        let attr = [NSFontAttributeName: font,
            NSForegroundColorAttributeName: color,
            NSParagraphStyleAttributeName: paragraphStyle]
        return attr
    }
    
}