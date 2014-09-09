//
//  BitmapUtil
//  Created by Exey Panteleev on 22/08/14.
//

import Foundation
import SpriteKit
import UIKit

public struct BitmapUtil {
    
    static public func combine(firstImage:UIImage, secondImage:UIImage, opaque:Bool, scale:CGFloat)->UIImage {
        let size:CGSize = CGSize(width: max(firstImage.size.width, secondImage.size.width), height: max(firstImage.size.height, secondImage.size.height))
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        let firstPos = CGPoint(x: round((size.width-firstImage.size.width)/2), y: round((size.height-firstImage.size.height)/2))
        let secondPos = CGPoint(x: round((size.width-secondImage.size.width)/2), y: round((size.height-secondImage.size.height)/2))
        firstImage.drawAtPoint(firstPos)
        secondImage.drawAtPoint(secondPos)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    static public func fromSize(size:CGSize, color:UIColor)->UIImage {
        var opaque:Bool = true
        if(color == UIColor.clearColor()) {
            opaque = false
        }
        UIGraphicsBeginImageContextWithOptions(size, opaque, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let img:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    static public func withCenterText(size:CGSize, text:NSString, backgroundColor:UIColor = UIColor.whiteColor(), font:UIFont = UIFont(name: "Arial", size: 18), fontColor:UIColor = UIColor.blackColor())->UIImage {
        // image
        let image:UIImage = BitmapUtil.fromSize(size, color: backgroundColor)
        UIGraphicsBeginImageContext(image.size)
        image.drawAtPoint(CGPoint(x: 0,y: 0))
        // text
        drawText(text, font:font, x: 0, y: 0, color: fontColor)
        //result
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    static public func drawText(text:NSString, font:UIFont, x:Int, y:Int, color:UIColor = UIColor.blackColor()) {
        let attr = TextUtil.getAttributes(font, color: UIColor.blackColor(), align: NSTextAlignment.Center)
        text.drawAtPoint(CGPoint(x: x, y: y), withAttributes: attr)
    }
    
    static public func drawTextInCenter(text:NSString, font:UIFont, size:CGSize, shift:CGPoint = CGPoint.zeroPoint, color:UIColor = UIColor.blackColor()) {
        let attr = TextUtil.getAttributes(font, color: color, align: NSTextAlignment.Center)
        // calculate center
        let textSize = text.sizeWithAttributes(attr)
        let x = shift.x + (size.width-textSize.width)/2
        let y = shift.y + (size.height-textSize.height)/2
        text.drawAtPoint(CGPoint(x: x, y: y), withAttributes: attr)
    }
    
    static public func withGridText(size:CGSize, text:NSString, cols:Int, rows:Int, backgroundColor:UIColor = UIColor.whiteColor(), font:UIFont = UIFont(name: "Arial", size: 18), fontColor:UIColor = UIColor.blackColor())->UIImage {
        // image
        let image:UIImage = BitmapUtil.fromSize(size, color: backgroundColor)
        UIGraphicsBeginImageContext(image.size)
        image.drawAtPoint(CGPoint(x: 0, y: 0))
        // text
        let tileSize = CGSize(width: (size.width/CGFloat(cols)), height: (size.height/CGFloat(rows)) )
        var textValue:NSString
        for x in 0 ..< cols {
            for y in 0 ..< rows {
                let shiftX = CGFloat(x) * tileSize.width
                let shiftY = CGFloat(y) * tileSize.height
                if (text.length == 0) {
                    textValue = "\(x), \(rows-y-1)"
                } else {
                    textValue = text
                }
                //println("GRID TEXT \(x) \(y) = \(shiftX) \(shiftY)")
                drawTextInCenter(textValue, font: font, size: tileSize, shift: CGPoint(x:shiftX, y:shiftY), color: fontColor)
            }
        }
        // result
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}