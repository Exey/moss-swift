//
//  UIImage+Grayscale.swift
//  Created by Exey Panteleev
//

import Foundation
import UIKit

extension UIImage {
    
    func grayscale() -> UIImage {
        let imageRect = CGRectMake(0, 0, self.size.width, self.size.height)

        let greyContext = CGBitmapContextCreate(
            nil, UInt(self.size.width*self.scale), UInt(self.size.height*self.scale),
            8, 0,
            CGColorSpaceCreateDeviceGray(),
            CGBitmapInfo(rawValue: CGImageAlphaInfo.None.rawValue))!
        let alphaContext = CGBitmapContextCreate(
            nil, UInt(self.size.width*self.scale), UInt(self.size.height*self.scale),
            8, 0,
            nil,
            CGBitmapInfo(rawValue: CGImageAlphaInfo.Only.rawValue))!
        CGContextScaleCTM(greyContext, self.scale, self.scale)
        CGContextScaleCTM(alphaContext, self.scale, self.scale)
        
        CGContextDrawImage(greyContext, imageRect, self.CGImage)
        CGContextDrawImage(alphaContext, imageRect, self.CGImage)
        
        let greyImage = CGBitmapContextCreateImage(greyContext)
        let maskImage = CGBitmapContextCreateImage(alphaContext)
        let combinedImage = CGImageCreateWithMask(greyImage, maskImage)
        return UIImage(CGImage: combinedImage)!
    }

}