//
//  AnimationUtil.swift
//  Created by Exey Panteleev on 16/03/15.
//

import Foundation

struct AnimationUtil {
    
    static let ROTATION:String      = "transform.rotation"
    static let SCALE:String         = "transform.scale"
    static let TRANSLATION_X:String = "transform.translation.x"
    static let TRANSLATION_Y:String = "transform.translation.y"
    static let SCALE_X:String       = "transform.scale.x"
    
    static func keyframeAnimationWithKeyPath(keyPath:String!, duration:CFTimeInterval,
                                             keyTimes:[AnyObject]!, values:[AnyObject]!) -> CAKeyframeAnimation {
            let anim:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: keyPath)
            anim.duration = duration
            anim.keyTimes = keyTimes
            anim.values = values
            return anim
    }
    
    static func animationWithKeyPath(keyPath:String!, duration:CFTimeInterval,
                                     fromValue:AnyObject!, toValue:AnyObject!) -> CABasicAnimation {
            let anim:CABasicAnimation = CABasicAnimation(keyPath: keyPath)
            anim.duration = duration
            anim.fromValue = fromValue
            anim.toValue = toValue
            return anim
    }
    
    static func groupAnimation(animations:[AnyObject]!, duration:CFTimeInterval,
                               delegate:AnyObject!, fillMode:String!, removedOnCompletion:Bool = true) -> CAAnimationGroup {
            let group:CAAnimationGroup = CAAnimationGroup()
            group.animations = animations
            group.duration = duration
            group.delegate = delegate
            group.fillMode = fillMode
            group.removedOnCompletion = removedOnCompletion
            return group
    }
    
}