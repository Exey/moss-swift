//
//  TextUtil
//  Created by Exey Panteleev on 29/08/14.
//

import Foundation
import UIKit

public struct TextUtil {
    
    static public func getAttributes(font:UIFont, color:UIColor, align:NSTextAlignment) -> [NSObject : AnyObject]! {
        let paragraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.alignment = align
        let attr = [NSFontAttributeName: font,
            NSForegroundColorAttributeName: color,
            NSParagraphStyleAttributeName: paragraphStyle]
        return attr
    }
    
    static public func labelWithAutosize(text:String, x:CGFloat, y:CGFloat, font:UIFont, color:UIColor, align:NSTextAlignment)->UILabel {
        // calculate size
        let attr = TextUtil.getAttributes(font, color: color, align: align)
        let textSize:CGSize = text.sizeWithAttributes(attr)
        // create label
        let label:UILabel = UILabel(frame: CGRect(x: x, y: y, width: textSize.width, height: textSize.height))
        label.font = font
        label.textColor = color
        label.text = text
        label.textAlignment = align
        return label
    }
    
}