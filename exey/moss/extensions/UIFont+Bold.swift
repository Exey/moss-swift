//
//  UIFont+Bold.swift
//  VEKA_Measurer
//
//  Created by Exey Panteleev on 10/04/15.
//  Copyright (c) 2015 Exey Panteleev. All rights reserved.
//

import Foundation

extension UIFont {
    func bold() -> UIFont {
        let descriptor = self.fontDescriptor().fontDescriptorWithSymbolicTraits(UIFontDescriptorSymbolicTraits.TraitBold)
        return UIFont(descriptor: descriptor!, size: 0)
    }
}